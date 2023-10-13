import 'package:faker/faker.dart';
import 'package:flutter_meedu/providers.dart';

import '../data/repositories_impl/auth_repository.dart';
import '../data/repositories_impl/reels_repository.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/reels_repository.dart';

class Repositories {
  Repositories._();

  static final reels = ArgumentsProvider<ReelsRepository, Faker>(
    (ref) => ReelsRepositoryImpl(faker: faker),
  );

  static final auth = ArgumentsProvider<AuthRepository, Faker>(
    (ref) => AuthRepositoryImpl(faker: faker),
  );
}
