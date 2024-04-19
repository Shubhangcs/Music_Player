import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/music/presentation/bloc/retrive_data_bloc.dart';
import 'package:music/music/presentation/pages/music_player_page.dart';
import 'package:permission_handler/permission_handler.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    getPermission();
    super.initState();
  }

  void getPermission() async {
    final permission = await Permission.audio.request();
    if (permission.isGranted) {
      getMusicFromLocal();
    } else {
      // nothing to do
    }
  }

  void getMusicFromLocal() {
    context.read<RetriveDataBloc>().add(
          RetriveData(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MUSIC",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: BlocBuilder<RetriveDataBloc, RetriveDataState>(
          builder: (context, state) {
            if (state is RetriveSuccessState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MusicPlayPage(songs: state.data,index: index,),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.music_note,
                          ),
                          title: Text(
                            state.data[index].title,
                          ),
                          subtitle: Text(
                            "${state.data[index].album}",
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                          endIndent: 20,
                          indent: 20,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: state.data.length,
              );
            }
            if (state is RetriveFailureState) {
              return const Text("No Songs Found");
            }
            return const CircularProgressIndicator(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
