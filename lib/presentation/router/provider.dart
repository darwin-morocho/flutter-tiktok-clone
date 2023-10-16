import 'package:flutter_meedu/providers.dart';
import 'package:go_router/go_router.dart';

import '../modules/home/view/widgets/scaffold.dart';
import 'routes/friends.dart';
import 'routes/home.dart';
import 'routes/messages.dart';
import 'routes/profile.dart';
import 'routes/sign_in.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: HomeRoute.path,
    routes: [
      SignInRoute.route,
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScaffold(
            state: state,
            child: navigationShell,
          );
        },
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
