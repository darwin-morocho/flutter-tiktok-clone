import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/friends/friends_view.dart';

class FriendsRoute {
  static const path = '/friends';
  static const name = 'Friends';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      builder: (_, state) => const FriendsView(),
    );
  }
}
