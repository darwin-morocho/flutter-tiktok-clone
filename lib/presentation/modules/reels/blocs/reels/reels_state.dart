import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/reel.dart';



part 'reels_state.freezed.dart';

@freezed
sealed class ReelsState with _$ReelsState {
  const factory ReelsState.loading() = ReelsLoadingState;
  const factory ReelsState.failed() = ReelsFailedState;
  const factory ReelsState.loaded({
    required int page,
    required List<Reel> reels,
    required bool fetching,
  }) = ReelsLoadedState;
}
