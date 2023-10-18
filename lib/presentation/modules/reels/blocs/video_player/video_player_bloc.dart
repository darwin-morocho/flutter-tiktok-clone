import 'dart:async';

import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:video_player/video_player.dart';

import 'video_player_state.dart';

final videoPlayerProvider =
    StateNotifierArgumentsProvider<VideoPlayerBloc, VideoPlayerState, String>(
  (ref) => VideoPlayerBloc(
    VideoPlayerState.loading(),
    controller: VideoPlayerController.networkUrl(
      Uri.parse(ref.arguments),
    ),
  )..init(),
  tags: true,
);

class VideoPlayerBloc extends StateNotifier<VideoPlayerState> {
  VideoPlayerBloc(
    super.initialState, {
    required this.controller,
  });

  final VideoPlayerController controller;

  Future<void> init() async {
    try {
      state = VideoPlayerState.loading();
      await controller.initialize();
      state = VideoPlayerState.loaded(
        duration: controller.value.duration,
      );
      await controller.setLooping(true);
      await controller.setVolume(0);
      controller.addListener(_listener);
      await controller.play();
    } catch (_) {
      state = VideoPlayerState.failed();
    }
  }

  Future<void> _listener() async {
    switch (state) {
      case VideoPlayerLoadedState loadedState:
        state = loadedState.copyWith(
          position: controller.value.position,
        );
      case _:
    }
  }

  Future<void> seekTo(Duration position) async {
    await controller.seekTo(position);
    switch (state) {
      case VideoPlayerLoadedState loadedState:
        state = loadedState.copyWith(
          position: position,
        );
      case _:
    }
  }

  Future<void> play() async {
    await controller.play();
    switch (state) {
      case VideoPlayerLoadedState loadedState:
        state = loadedState.copyWith(
          playing: true,
        );
      case _:
    }
  }

  Future<void> pause() async {
    await controller.pause();
    switch (state) {
      case VideoPlayerLoadedState loadedState:
        state = loadedState.copyWith(
          playing: false,
        );
      case _:
    }
  }

  @override
  FutureOr<void> dispose() async {
    controller.removeListener(_listener);
    await controller.dispose();
    return super.dispose();
  }
}
