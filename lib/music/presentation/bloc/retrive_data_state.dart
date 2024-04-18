part of 'retrive_data_bloc.dart';

sealed class RetriveDataState {}

final class RetriveDataInitial extends RetriveDataState {}

final class RetriveSuccessState extends RetriveDataState {
  List<SongModel> data;
  RetriveSuccessState({required this.data});
}

final class RetriveFailureState extends RetriveDataState {
  final String error;
  RetriveFailureState({required this.error});
}

final class RetriveLoadingState extends RetriveDataState {}

final class PlayingState extends RetriveDataState {
  final AudioPlayer audioPlayer;
  final bool playing = true;
  PlayingState({
    required this.audioPlayer,
  });
}

final class PauseState extends RetriveDataState {}
