import 'package:flutter/material.dart';

import '../../../../../domain/models/reel.dart';
import 'actions.dart';
import 'info.dart';

class ReelViewer extends StatelessWidget {
  const ReelViewer({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
    );
  }
}
