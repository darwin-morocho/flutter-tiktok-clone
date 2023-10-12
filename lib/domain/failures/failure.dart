import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.unathorized() = UnathorizedFailure;
  const factory Failure.unknown() = UnknownFailure;
}
