import 'package:go_router/go_router.dart';

import '../../modules/sign_in/view/sign_in_view.dart';
import '../provider.dart';
import 'home.dart';

class SignInRoute {
  static const path = '/sign-in';
  static const name = 'Sign In';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      parentNavigatorKey: rootNavigationKey,
      builder: (_, state) => SignInView(
        redirect: state.uri.queryParameters['redirect'] ?? HomeRoute.path,
      ),
    );
  }
}
