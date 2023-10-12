import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../core/either.dart';
import '../../../core/typedefs.dart';
import '../../../domain/failures/failure.dart';
import '../../../domain/models/user.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../repositories.dart';

final sessionProvider = StateNotifierProvider<SessionBloc, User?>(
  (_) => SessionBloc(
    null,
    authRepository: Repositories.auth.read(),
  ),
  autoDispose: false,
);

class SessionBloc extends StateNotifier<User?> {
  SessionBloc(
    super.initialState, {
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  FutureEither<Failure, User> signIn() async {
    final result = await _authRepository.signIn();

    switch (result) {
      case Right(value: final user):
        state = user;
      case _:
    }

    return result;
  }

  void signOut() {
    state = null;
  }
}
