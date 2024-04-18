import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/music/domain/usecase/local_data_usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';
part 'retrive_data_event.dart';
part 'retrive_data_state.dart';

class RetriveDataBloc extends Bloc<RetriveDataEvent, RetriveDataState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final GetMusicFromLocalStorageUseCase _usecase;
  RetriveDataBloc({required GetMusicFromLocalStorageUseCase usecase})
      : _usecase = usecase,
        super(RetriveDataInitial()) {
    on<RetriveData>((event, emit) async {
      emit(RetriveLoadingState());
      final response = await _usecase();
      response.fold(
        (l) => emit(
          RetriveFailureState(
            error: l.errorMessage,
          ),
        ),
        (r) => emit(
          RetriveSuccessState(
            data: r,
          ),
        ),
      );
    });
    on<PlayMusic>((event, emit) async {
      await _audioPlayer.setAudioSource(
        initialPosition: Duration.zero,
        AudioSource.uri(
          Uri.parse(
            event.uri,
          ),
        ),
      );
      _audioPlayer.play();
      emit(
        PlayingState(
          audioPlayer: _audioPlayer,
        ),
      );
    });
    on<PauseMusic>((event, emit) {
      _audioPlayer.pause();
      emit(PauseState());
    });
  }
}
