import 'package:fpdart/fpdart.dart';
import 'package:music/utils/exception/failure.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract interface class GetMusicFromLocalStorageRepository {
  Future<Either<Failure, List<SongModel>>> getMusicFromLocalStorageRepository();
}
