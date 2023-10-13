import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/profile/profile_view.dart';

class ProfileRoute {
  static const path = '/profile';
  static const name = 'Profile';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      builder: (_, __) => const ProfileView(),
    );
  }
}
