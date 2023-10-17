import 'package:flutter/material.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/reels/reels_bloc.dart';
import '../../blocs/reels/reels_state.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import 'reel_viewer.dart';

class ReelsPageView extends StatelessWidget {
  const ReelsPageView({super.key, required this.reels});
  final List<Reel> reels;

  @override
  Widget build(BuildContext context) {
    Future<void> loadReels(bool more) async {
      final reelsBloc = reelsProvider.read();
      switch (reelsBloc.state) {
        case ReelsLoadedState state:
          if (!state.fetching) {
            await reelsBloc.load(more ? state.page + 1 : 0);
          }
        case _:
      }
    }

    return RefreshIndicator(
      onRefresh: () => loadReels(false),
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          if (index != reels.length - 2) {
            return;
          }
          loadReels(true);
        },
        itemBuilder: (_, index) {
          final reel = reels[index];
          videoPlayerProvider.setArguments(
            reel.mediaURL,
            tag: reel.id,
          );
          return ReelViewer(reel: reel);
        },
        itemCount: reels.length,
      ),
    );
  }
}
