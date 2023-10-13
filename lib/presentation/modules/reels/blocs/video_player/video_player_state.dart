import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.loading() = VideoPlayerLoadingState;
  const factory VideoPlayerState.failed() = VideoPlayerFailedState;
  const factory VideoPlayerState.loaded({
    required Duration duration,
    Duration? sliderPosition,
    @Default(Duration.zero) Duration position,
    @Default(false) bool muted,
    @Default(PlayerStatus.ready()) PlayerStatus status,
  }) = VideoPlayerLoadedState;
}

@freezed
class PlayerStatus with _$PlayerStatus {
  const factory PlayerStatus.ready() = PlayerReadyStatus;
  const factory PlayerStatus.playing() = PlayerPlayingStatus;
  const factory PlayerStatus.paused() = PlayerPausedStatus;
  const factory PlayerStatus.finished() = PlayerFinishedStatus;
}

@freezed
class VideoKey with _$VideoKey {
  const factory VideoKey({
    required String reelId,
    required String mediaURL,
  }) = _VideoKey;
}
