import 'package:go_router/go_router.dart';

import '../../modules/user/view/user_view.dart';
import '../provider.dart';
import 'home.dart';

class UserProfileRoute {
  static const path = '/user/:id';
  static const name = 'User Profolie';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: name,
      parentNavigatorKey: rootNavigationKey,
      redirect: (context, state) {
        final userId = state.pathParameters['id'];
        if (userId?.isEmpty ?? false) {
          return HomeRoute.path;
        }
        return null;
      },
      builder: (_, state) => UserView(
        userId: state.pathParameters['id']!,
      ),
    );
  }
}
