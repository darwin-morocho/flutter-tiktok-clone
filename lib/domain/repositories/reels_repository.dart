import '../../core/typedefs.dart';
import '../failures/failure.dart';
import '../models/reel.dart';

abstract class ReelsRepository {
  FutureEither<Failure, List<Reel>> getReels({
    required int page,
  });
}
