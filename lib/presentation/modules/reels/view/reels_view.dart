import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/widgets/context_provider.dart';
import '../blocs/reels/reels_bloc.dart';
import '../blocs/reels/reels_state.dart';
import 'widgets/reels_page_view.dart';

class ReelsTag {
  ReelsTag({required this.tag});

  final String tag;
}

class ReelsView extends StatelessWidget {
  const ReelsView({
    super.key,
    required this.reelsTag,
  });

  final ReelsTag reelsTag;

  @override
  Widget build(BuildContext context) {
    return ContextProvider(
      value: reelsTag,
      child: Consumer(
        builder: (_, ref, __) {
          final state = ref.watch(reelsProvider, tag: reelsTag.tag).state;

          return switch (state) {
            ReelsLoadingState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            ReelsFailedState _ => const Center(
                child: Text('Something was wrong'),
              ),
            ReelsLoadedState state => ReelsPageView(state: state),
          };
        },
      ),
    );
  }
}
