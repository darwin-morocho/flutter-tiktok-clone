import 'package:flutter/material.dart';

class VideoPlayerSlider extends StatelessWidget {
  const VideoPlayerSlider({
    super.key,
    required this.onChanged,
    required this.duration,
    required this.position,
  });
  final Duration position;
  final Duration duration;

  final void Function(Duration) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: SliderTheme(
        data: SliderThemeData(
          trackShape: _SliderTrackShape(),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 2,
          ),
        ),
        child: Slider(
          thumbColor: Colors.white,
          activeColor: Colors.white,
          inactiveColor: Colors.white24,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (value) => onChanged(
            Duration(
              seconds: value.toInt(),
            ),
          ),
        ),
      ),
    );
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
      0,
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
    final top = parentBox.size.height * 0.5 - 2;
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
