import 'package:music/utils/exception/local_folder_access_exception.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract interface class GetMusicFromLocalStorageDataSource {
  Future<List<SongModel>> getSongFromLocalStorageDataSource();
}

class GetMusicFromLocalStorageDataSourceImpl extends GetMusicFromLocalStorageDataSource {
  final OnAudioQuery audioQueries;
  GetMusicFromLocalStorageDataSourceImpl({required this.audioQueries});
  @override
  Future<List<SongModel>> getSongFromLocalStorageDataSource() {
    try {
      final Future<List<SongModel>> audios = audioQueries.querySongs();
      return audios;
    } catch (e) {
      throw LocalDataException(errorMessage: e.toString());
    }
  }
}
