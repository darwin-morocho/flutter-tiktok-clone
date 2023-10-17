import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';

@freezed
sealed class VideoPlayerState with _$VideoPlayerState {
  factory VideoPlayerState.loading() = VideoPlayerLoadingState;
  factory VideoPlayerState.failed() = VideoPlayerFailedState;
  factory VideoPlayerState.loaded({
    required Duration duration,
    @Default(Duration.zero) Duration position,
    @Default(true) bool playing,
  }) = VideoPlayerLoadedState;
}
