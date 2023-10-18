import 'package:flutter_meedu/notifiers/state_notifier.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../../core/either.dart';
import '../../../../../core/typedefs.dart';
import '../../../../../domain/failures/failure.dart';
import '../../../../../domain/models/reel.dart';
import '../../../../../domain/repositories/reels_repository.dart';
import '../../../../repositories.dart';
import 'reels_state.dart';

final reelsProvider = Provider.stateTag<ReelsBloc, ReelsState>(
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
    await load(0);
  }

  FutureEither<Failure, List<Reel>> load(int page) async {
    switch (state) {
      case ReelsLoadedState loadedState:
        state = loadedState.copyWith(fetching: true);
      case _:
        state = ReelsState.loading();
    }

    final result = await _reelsRepository.getReels(page: page);

    state = switch (result) {
      Right(value: final reels) => ReelsState.loaded(
          reels: [
            if (page > 0)
              ...switch (state) {
                ReelsLoadedState loadedState => loadedState.reels,
                _ => [],
              },
            ...reels,
          ],
          page: page,
        ),
      Left _ => switch (state) {
          ReelsLoadedState loadedState => loadedState.copyWith(fetching: false),
          _ => ReelsState.failed(),
        },
    };

    return result;
  }
}
