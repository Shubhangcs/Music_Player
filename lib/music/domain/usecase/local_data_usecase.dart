import 'package:fpdart/src/either.dart';
import 'package:music/music/domain/repository/local_data_repository.dart';
import 'package:music/utils/exception/failure.dart';
import 'package:music/utils/usecases/usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GetMusicFromLocalStorageUseCase implements UseCase<List<SongModel>> {
  final GetMusicFromLocalStorageRepository getMusicFromLocalStorageRepository;
  GetMusicFromLocalStorageUseCase(
      {required this.getMusicFromLocalStorageRepository});
  @override
  Future<Either<Failure, List<SongModel>>> call() {
    return getMusicFromLocalStorageRepository
        .getMusicFromLocalStorageRepository();
  }
}
