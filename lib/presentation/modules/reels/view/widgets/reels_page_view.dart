import 'package:flutter/material.dart';

import '../../../../../domain/models/reel.dart';
import 'reel_viewer.dart';

class ReelsPageView extends StatelessWidget {
  const ReelsPageView({super.key, required this.reels});
  final List<Reel> reels;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        final reel = reels[index];
        return ReelViewer(reel: reel);
      },
      itemCount: reels.length,
    );
  }
}
