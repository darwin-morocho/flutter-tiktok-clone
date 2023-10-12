import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel.freezed.dart';

@freezed
class Reel with _$Reel {
  const factory Reel({
    required String id,
    required String description,
    required String mediaURL,
    required ReelAutor autor,
    required int likes,
    required int favorites,
    required bool iLikeIt,
  }) = _Reel;
}

@freezed
class ReelAutor with _$ReelAutor {
  const factory ReelAutor({
    required String id,
    required String displayName,
    String? photoURL,
  }) = _ReelAutor;
}
