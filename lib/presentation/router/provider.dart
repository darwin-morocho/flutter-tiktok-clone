import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:go_router/go_router.dart';

import '../modules/home/view/widgets/scaffold.dart';
import 'routes/friends.dart';
import 'routes/home.dart';
import 'routes/messages.dart';
import 'routes/profile.dart';
import 'routes/sign_in.dart';

final routerProvider = Provider(
  (_) => GoRouter(
    initialLocation: HomeRoute.path,
    routes: [
      SignInRoute.route,
      StatefulShellRoute.indexedStack(
        builder: (_, state, child) => HomeScaffold(
          routerState: state,
          child: child,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              HomeRoute.route,
            ],
          ),
          StatefulShellBranch(
            routes: [
              FriendsRoute.route,
            ],
          ),
          StatefulShellBranch(
            routes: [
              MessagesRoute.route,
            ],
          ),
          StatefulShellBranch(
            routes: [
              ProfileRoute.route,
            ],
          ),
        ],
      ),
    ],
  ),
);
