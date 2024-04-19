import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/music/presentation/bloc/retrive_data_bloc.dart';
import 'package:music/music/presentation/widgets/neo_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPlayPage extends StatefulWidget {
  final List<SongModel> songs;
  final int index;
  const MusicPlayPage({super.key, required this.songs, required this.index});

  @override
  State<MusicPlayPage> createState() => _MusicPlayPageState();
}

class _MusicPlayPageState extends State<MusicPlayPage> {
  Duration _changeDuration = const Duration();
  Duration _endPosition = const Duration();
  int ins = 0;
  @override
  void initState() {
    context.read<RetriveDataBloc>().add(
          PlayMusic(
            uri: widget.songs[widget.index].uri!,
            duration: _changeDuration,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PLAYLIST",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: BlocConsumer<RetriveDataBloc, RetriveDataState>(
        listener: (context, state) {
          if (state is PlayingState) {
            state.audioPlayer.durationStream.listen((ds) {
              setState(() {
                _endPosition = ds!;
              });
            });
            state.audioPlayer.positionStream.listen((cs) {
              setState(() {
                _changeDuration = cs;
              });
            });
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: NeoButton(
                  height: 400,
                  width: MediaQuery.of(context).size.width - 40,
                  child: const Text(""),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_changeDuration.toString().split(".")[0]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 0,
                      ),
                    ),
                    child: Slider(
                      activeColor: Colors.green,
                      value: _changeDuration.inSeconds.toDouble(),
                      max: _endPosition.inSeconds.toDouble(),
                      min: 0,
                      onChanged: (value) {
                        setState(() {
                          (state is PlayingState)
                              ? state.audioPlayer
                                  .seek(Duration(seconds: value.toInt()))
                              : "";
                          value = value;
                        });
                      },
                      inactiveColor: Colors.white,
                    ),
                  ),
                  Text(
                    _endPosition.toString().split(".")[0],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: const NeoButton(
                        height: 60,
                        child: Icon(
                          Icons.skip_previous,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (state is PlayingState) {
                        context.read<RetriveDataBloc>().add(
                              PauseMusic(),
                            );
                      } else {
                        context.read<RetriveDataBloc>().add(
                              PlayMusic(
                                uri: widget.songs[widget.index].uri!,
                                duration: _changeDuration,
                              ),
                            );
                      }
                    },
                    child: NeoButton(
                      width: 140,
                      height: 60,
                      child: Icon(
                        (state is PlayingState)
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ins = widget.index + 1;
                        if (widget.songs[ins].uri != null) {
                          context.read<RetriveDataBloc>().add(
                                PlayMusic(
                                  uri: widget.songs[ins].uri!,
                                  duration: _changeDuration,
                                ),
                              );
                        } else {
                          context.read<RetriveDataBloc>().add(
                                PlayMusic(
                                  uri: widget.songs[widget.index-widget.index].uri!,
                                  duration: _changeDuration,
                                ),
                              );
                        }
                      },
                      child: const NeoButton(
                        height: 60,
                        child: Icon(
                          Icons.skip_next,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
