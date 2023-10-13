import 'package:faker/faker.dart';

import '../../core/either.dart';
import '../../core/typedefs.dart';
import '../../domain/failures/failure.dart';
import '../../domain/models/reel.dart';
import '../../domain/repositories/reels_repository.dart';

class ReelsRepositoryImpl implements ReelsRepository {
  ReelsRepositoryImpl({
    required Faker faker,
  }) : _faker = faker;

  final Faker _faker;

  @override
  FutureEither<Failure, List<Reel>> getReels({
    required int page,
  }) async {
    const videos = [
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274665064-559605b7-f36d-4bac-a97f-3b4137b4a592.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274661756-2f55b150-17f7-4347-8d23-084ca3049217.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274661783-0f7fd362-4253-4818-88a0-7cacd3644173.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274661789-5623814d-ff8b-4590-83da-1673224aec30.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274664382-a5501043-1998-471e-9f95-e9eb3e505c4f.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274661799-b7eef5a7-171d-441b-b1e0-3bd17be20a98.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274664886-4cfae454-07c5-45cd-9dde-316f31161151.mp4',
      'https://github-production-user-asset-6210df.s3.amazonaws.com/15864336/274661803-1e47003b-db60-4843-a665-3e9a024d7b65.mp4',
    ];

    await Future.delayed(
      const Duration(seconds: 1),
    );
    return Either.right(
      List.generate(
        8,
        (index) {
          return Reel(
            id: (index * page).toString(),
            description: _faker.lorem.sentence(),
            mediaURL: videos[index],
            autor: ReelAutor(
              id: _faker.guid.guid(),
              displayName: _faker.person.name(),
              photoURL: _faker.image.image(
                width: 200,
                height: 200,
                random: true,
                keywords: ['profile'],
              ),
            ),
            likes: faker.randomGenerator.integer(10000000),
            favorites: faker.randomGenerator.integer(10000),
            iLikeIt: faker.randomGenerator.boolean(),
          );
        },
      ),
    );
  }
}
