import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/home/home_view.dart';

class HomeRoute {
  static const path = '/home';
  static const name = 'Home';

   static get route {
    return GoRoute(
      path: path,
      name: name,
      builder: (_, __) => const HomeView(),
    );
  }
}
