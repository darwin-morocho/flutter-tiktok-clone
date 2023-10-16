import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/friends/friends_view.dart';
import '../guards/auth_guard.dart';

class FriendsRoute {
  static const path = '/friends';
  static const name = 'Friends';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: authGuard,
      builder: (_, state) => const FriendsView(),
    );
  }
}
