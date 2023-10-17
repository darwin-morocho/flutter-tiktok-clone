import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:flutter_meedu/providers.dart';

import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';

class VideoPlayerSlider extends ConsumerWidget {
  const VideoPlayerSlider({
    super.key,
    required this.tag,
  });
  final String tag;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final bloc = ref.watch(
      videoPlayerProvider.select(
        (state) => switch (state) {
          VideoPlayerLoadedState state => state.position,
          _ => null,
        },
        tag: tag,
      ),
    );

    switch (bloc.state) {
      case VideoPlayerLoadedState state:
        return SliderTheme(
          data: SliderThemeData(
            trackShape: _SliderTrackShape(),
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 4,
            ),
          ),
          child: Slider(
            thumbColor: Colors.white,
            activeColor: Colors.white,
            inactiveColor: Colors.white24,
            max: state.duration.inSeconds.toDouble(),
            value: state.position.inSeconds.toDouble(),
            onChanged: (value) => bloc.seekTo(
              Duration(
                seconds: value.toInt(),
              ),
            ),
          ),
        );
      case _:
        return const SizedBox.shrink();
    }
  }
}

class _SliderTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool? isEnabled,
    bool? isDiscrete,
  }) {
    return Rect.fromLTWH(
      0,
      parentBox.size.height * 0.5 - 2,
      parentBox.size.width,
      parentBox.size.height,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool? isEnabled,
    bool? isDiscrete,
    required TextDirection textDirection,
  }) {
    final paint = Paint();
    paint.color = Colors.white30;
    final canvas = context.canvas;
    final top = parentBox.size.height - 4;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          top,
          parentBox.size.width,
          4,
        ),
        const Radius.circular(4),
      ),
      paint,
    );

    paint.color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          top,
          thumbCenter.dx,
          4,
        ),
        const Radius.circular(4),
      ),
      paint,
    );
  }
}
