import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../../core/either.dart';
import '../../../../../core/typedefs.dart';
import '../../../../../domain/failures/failure.dart';
import '../../../../../domain/models/reel.dart';
import '../../../../../domain/repositories/reels_repository.dart';
import '../../../../repositories.dart';
import 'reels_state.dart';

final reelsProvider = StateNotifierProvider<ReelsBloc, ReelsState>(
  (_) => ReelsBloc(
    const ReelsState.loading(),
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
    state = const ReelsState.loading();
    await load(1);
  }

  FutureEither<Failure, List<Reel>> load(int page) async {
    switch (state) {
      case ReelsLoadedState loadedState:
        state = loadedState.copyWith(
          fetching: true,
        );
      case _:
    }

    final result = await _reelsRepository.getReels(page: page);

    state = switch (result) {
      Left _ => switch (state) {
          ReelsLoadedState loadedState => loadedState.copyWith(
              fetching: false,
            ),
          _ => const ReelsState.failed(),
        },
      Right(value: final reels) => ReelsState.loaded(
          page: page,
          reels: reels,
          fetching: false,
        ),
    };

    return result;
  }
}
