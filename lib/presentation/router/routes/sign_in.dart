import 'package:go_router/go_router.dart';

import '../../global/blocs/session_bloc.dart';
import '../../modules/sign_in/view/sign_in_view.dart';
import 'home.dart';

class SignInRoute {
  static const path = '/sign-in';
  static const name = 'Sign In';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: (_, __) {
        final authenticatedUser = sessionProvider.read().state;
        if (authenticatedUser != null) {
          return HomeRoute.path;
        }
        return null;
      },
      builder: (_, state) => SignInView(
        redirect: state.uri.queryParameters['redirect'] ?? HomeRoute.path,
      ),
    );
  }
}
