import 'package:fpdart/src/either.dart';
import 'package:music/music/data/datasource/local_data_source.dart';
import 'package:music/utils/exception/failure.dart';
import 'package:music/utils/exception/local_folder_access_exception.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';

import '../../domain/repository/local_data_repository.dart';

class GetMusicFromLocalStorageRepositoryImpl
    implements GetMusicFromLocalStorageRepository {
  final GetMusicFromLocalStorageDataSource dataSource;
  GetMusicFromLocalStorageRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<SongModel>>>
      getMusicFromLocalStorageRepository() async {
    try {
      final List<SongModel> audios = await dataSource.getSongFromLocalStorageDataSource();
      return right(audios);
    } on LocalDataException catch (e) {
      return left(Failure(errorMessage: e.errorMessage));
    }
  }
}
