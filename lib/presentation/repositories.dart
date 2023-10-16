import 'package:faker/faker.dart';
import 'package:flutter_meedu/providers.dart';

import '../data/repositories_impl/auth_repository.dart';
import '../data/repositories_impl/reels_repository.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/reels_repository.dart';

final fakerProvider = Provider(
  (ref) => Faker(),
);

class Repositories {
  Repositories._();

  static final auth = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(
      faker: fakerProvider.read(),
    ),
  );

  static final reels = Provider<ReelsRepository>(
    (ref) => ReelsRepositoryImpl(
      faker: fakerProvider.read(),
    ),
  );
}
