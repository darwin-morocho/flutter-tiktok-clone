import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:flutter_meedu/screen_utils.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';
import 'player_slider.dart';

class ReelInfo extends StatelessWidget {
  const ReelInfo({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black38,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20).copyWith(
              bottom: 10,
            ),
            child: Text(
              reel.autor.displayName,
              style: context.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 20,
              right: 60,
              bottom: 20,
            ),
            child: Text(
              reel.description,
              style: context.textTheme.labelMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Consumer(
            builder: (_, ref, __) {
              final bloc = ref.watch(
                videoPlayerProvider,
                tag: reel.id,
              );
              return switch (bloc.state) {
                VideoPlayerLoadedState state => VideoPlayerSlider(
                    position: state.sliderPosition ?? state.position,
                    duration: state.duration,
                    onChanged: bloc.onPosition,
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }
}
