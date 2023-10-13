import 'package:flutter/material.dart';

import '../../../../global/widgets/context_provider.dart';
import '../../blocs/reels/reels_state.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import 'reel_viewer.dart';

class ReelsPageView extends StatelessWidget {
  const ReelsPageView({super.key, required this.state});
  final ReelsLoadedState state;

  @override
  Widget build(BuildContext context) {
    final reels = state.reels;

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        final reel = reels[index];
        videoPlayerProvider.setArguments(
          reel.mediaURL,
          tag: reel.id,
        );
        return ContextProvider(
          value: reel,
          child: ReelViewer(reel: reel),
        );
      },
      itemCount: reels.length,
    );
  }
}
