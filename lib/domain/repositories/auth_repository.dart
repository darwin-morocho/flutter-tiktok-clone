import '../../core/typedefs.dart';
import '../failures/failure.dart';
import '../models/user.dart';

abstract class AuthRepository {
  FutureEither<Failure, User> signIn();
}
