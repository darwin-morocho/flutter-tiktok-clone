import 'package:flutter_meedu/notifiers/state_notifier.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../../core/either.dart';
import '../../../../../domain/repositories/reels_repository.dart';
import '../../../../repositories.dart';
import 'reels_state.dart';

final reelsProvider = StateNotifierProvider<ReelsBloc, ReelsState>(
  (ref) => ReelsBloc(
    ReelsState.loading(),
    reelsRepository: Repositories.reels.read(),
  )..init(),
);

class ReelsBloc extends StateNotifier<ReelsState> {
  ReelsBloc(
    super.initialState, {
    required ReelsRepository reelsRepository,
  }) : _reelsRepository = reelsRepository;

  final ReelsRepository _reelsRepository;

  Future<void> init() async {
    final result = await _reelsRepository.getReels(page: 1);

    state = switch (result) {
      Right(value: final reels) => ReelsState.loaded(reels: reels),
      Left _ => ReelsState.failed(),
    };
  }
}
