import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:video_player/video_player.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';
import 'actions.dart';
import 'info.dart';
import 'player_slider.dart';

class ReelViewer extends StatelessWidget {
  const ReelViewer({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (_, ref, __) {
            final bloc = ref.watch(
              videoPlayerProvider,
              tag: reel.id,
            );
            return switch (bloc.state) {
              VideoPlayerLoadingState _ => const Center(
                  child: CircularProgressIndicator(),
                ),
              VideoPlayerFailedState _ => Center(
                  child: TextButton(
                    onPressed: bloc.init,
                    child: const Text('Retry'),
                  ),
                ),
              VideoPlayerLoadedState _ => SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: bloc.controller.value.size.width,
                      height: bloc.controller.value.size.height,
                      child: VideoPlayer(
                        bloc.controller,
                      ),
                    ),
                  ),
                ),
            };
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ReelInfo(reel: reel),
        ),
        Positioned(
          right: 20,
          bottom: 40,
          child: ReelActions(reel: reel),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoPlayerSlider(
            tag: reel.id,
          ),
        ),
      ],
    );
  }
}
