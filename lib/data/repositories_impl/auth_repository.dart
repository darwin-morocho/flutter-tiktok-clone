import 'package:faker/faker.dart';

import '../../core/either.dart';
import '../../core/typedefs.dart';
import '../../domain/failures/failure.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required Faker faker}) : _faker = faker;

  final Faker _faker;

  @override
  FutureEither<Failure, User> signIn() async {
    return Either.right(
      User(
        id: _faker.guid.guid(),
        displayName: _faker.person.name(),
        photoURL: _faker.image.image(
          width: 200,
          height: 200,
          random: true,
          keywords: ['profile'],
        ),
      ),
    );
  }
}
