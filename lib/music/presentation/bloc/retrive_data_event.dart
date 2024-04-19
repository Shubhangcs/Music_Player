part of 'retrive_data_bloc.dart';

sealed class RetriveDataEvent {}

final class RetriveData extends RetriveDataEvent {}

final class PlayMusic extends RetriveDataEvent {
  final String uri;
  final Duration duration;
  PlayMusic({required this.uri , required this.duration});
}

final class PauseMusic extends RetriveDataEvent {}

final class SkipNextMusic extends RetriveDataEvent {}

final class SkipPreviousMusic extends RetriveDataEvent {}
