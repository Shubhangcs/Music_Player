import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/music/data/datasource/local_data_source.dart';
import 'package:music/music/data/repository/local_data_repo_impl.dart';
import 'package:music/music/domain/usecase/local_data_usecase.dart';
import 'package:music/music/presentation/bloc/retrive_data_bloc.dart';
import 'package:music/music/presentation/pages/album_page.dart';
import 'package:music/utils/theme/theme.dart';
import 'package:on_audio_query/on_audio_query.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RetriveDataBloc(
            usecase: GetMusicFromLocalStorageUseCase(
              getMusicFromLocalStorageRepository:
                  GetMusicFromLocalStorageRepositoryImpl(
                dataSource: GetMusicFromLocalStorageDataSourceImpl(
                  audioQueries: OnAudioQuery(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AlbumPage(),
      darkTheme: ApplicationTheme.darkAppTheme,
      theme: ApplicationTheme.lightAppTheme,
      themeMode: ThemeMode.system,
    );
  }
}
