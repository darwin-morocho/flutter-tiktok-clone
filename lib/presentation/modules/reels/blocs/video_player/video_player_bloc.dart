import 'dart:async';

import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:video_player/video_player.dart';

import 'video_player_state.dart';

final videoPlayerProvider =
    StateNotifierArgumentsProvider<VideoPlayerBloc, VideoPlayerState, String>(
  (ref) => VideoPlayerBloc(
    const VideoPlayerState.loading(),
    controller: VideoPlayerController.networkUrl(
      Uri.parse(ref.arguments),
    ),
  )..init(),
);

class VideoPlayerBloc extends StateNotifier<VideoPlayerState> {
  VideoPlayerBloc(
    super.initialState, {
    required this.controller,
  });

  final VideoPlayerController controller;

  VideoPlayerLoadedState get loadedState => switch (state) {
        VideoPlayerLoadedState loadedState => loadedState,
        _ => throw AssertionError(
            'state is not an instance of VideoPlayerLoadedState',
          ),
      };

  Future<void> init() async {
    try {
      switch (state) {
        case VideoPlayerFailedState():
          state = const VideoPlayerState.loading();
      }

      await controller.initialize();
      state = VideoPlayerState.loaded(
        duration: controller.value.duration,
      );
      controller.addListener(_listener);
      await play();
    } catch (_) {
      state = const VideoPlayerState.failed();
    }
  }

  void _listener() async {
    final controllerValue = controller.value;
    final position = controllerValue.position;

    final finished = position == loadedState.duration;

    if (finished) {
      await onPosition(Duration.zero);
      await play();
    } else {
      state = loadedState.copyWith(
        position: position,
        status: loadedState.status,
      );
    }
  }

  Future<void> play() async {
    await controller.play();
    await controller.setVolume(0);
    state = loadedState.copyWith(
      status: const PlayerStatus.playing(),
    );
  }

  Future<void> pause() async {
    await controller.pause();
    state = loadedState.copyWith(
      status: const PlayerStatus.paused(),
    );
  }

  Future<void> togglePlay() {
    switch (loadedState.status) {
      case PlayerPausedStatus():
        return play();
      case _:
        return pause();
    }
  }

  Future<void> toggleMute() async {
    final muted = !loadedState.muted;
    await controller.setVolume(muted ? 0 : 1);
    state = loadedState.copyWith(
      muted: muted,
    );
  }

  void onSliderPositionChanged(Duration sliderPosition) {
    state = loadedState.copyWith(
      sliderPosition: sliderPosition,
    );
  }

  Future<void> onPosition(Duration position) async {
    await controller.seekTo(position);
    state = loadedState.copyWith(
      position: position,
      sliderPosition: null,
    );
  }

  @override
  FutureOr<void> dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    return super.dispose();
  }
}
