import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/profile/profile_view.dart';
import '../guards/auth_guard.dart';

class ProfileRoute {
  static const path = '/profile';
  static const name = 'Profile';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: authGuard,
      builder: (_, __) => const ProfileView(),
    );
  }
}
