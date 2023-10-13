import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:video_player/video_player.dart';

import '../../../../../domain/models/reel.dart';
import '../../../../global/widgets/context_provider.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';

class ReelVideoPlayer extends ConsumerWidget {
  const ReelVideoPlayer({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final reel = ContextProvider.of<Reel>(context);
    final videoPlayerBloc = ref.watch(
      videoPlayerProvider,
      tag: reel.id,
    );

    final videoPlayerState = videoPlayerBloc.state;
    final videoPlayerController = videoPlayerBloc.controller;
    return switch (videoPlayerState) {
      VideoPlayerLoadedState _ => Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: videoPlayerController.value.size.width,
                  height: videoPlayerController.value.size.height,
                  child: VideoPlayer(videoPlayerController),
                ),
              ),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: videoPlayerBloc.togglePlay,
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 80,
                      color: Colors.white.withOpacity(
                        switch (videoPlayerState.status) {
                          PlayerPausedStatus() => 0.3,
                          _ => 0,
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      VideoPlayerLoadingState _ => const Center(
          child: CircularProgressIndicator(),
        ),
      _ => const Text(
          'Media could not be loaded',
        ),
    };
  }
}
