import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';
import 'actions.dart';
import 'info.dart';
import 'reel_video_player.dart';

class ReelViewer extends StatelessWidget {
  const ReelViewer({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(reel.id),
      onVisibilityChanged: (info) {
        if (!context.mounted || info.visibleFraction != 0) {
          return;
        }

        if (!videoPlayerProvider.mounted(tag: reel.id)) {
          return;
        }

        final videoPlayerBloc = videoPlayerProvider.read(tag: reel.id);

        switch (videoPlayerBloc.state) {
          case VideoPlayerLoadedState state:
            switch (state.status) {
              case PlayerPlayingStatus _:
                videoPlayerBloc.pause();
            }
        }
      },
      child: Stack(
        children: [
          const ReelVideoPlayer(),
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
        ],
      ),
    );
  }
}
