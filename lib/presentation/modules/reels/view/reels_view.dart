import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../blocs/reels/reels_bloc.dart';
import '../blocs/reels/reels_state.dart';
import 'widgets/reels_page_view.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final bloc = ref.watch(reelsProvider, tag: tag);

        return switch (bloc.state) {
          ReelsLoadingState _ => const Center(
              child: CircularProgressIndicator(),
            ),
          ReelsFailedState _ => Center(
              child: TextButton(
                onPressed: bloc.init,
                child: const Text('Retry'),
              ),
            ),
          ReelsLoadedState state => ReelsPageView(
              reels: state.reels,
            ),
        };
      },
    );
  }
}
