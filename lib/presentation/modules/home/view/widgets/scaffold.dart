import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/guards/auth_guard.dart';
import '../../../sign_in/view/sign_in_view.dart';
import 'bottom_navigation_bar.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
    required this.routerState,
    required this.child,
  });

  final GoRouterState routerState;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Future<void> goTo(HomeBottomNavigationBarItem item) async {
      if (item == HomeBottomNavigationBarItem.home) {
        context.go(item.routePath);
        return;
      }

      final isSignedIn = await authGuard(context, routerState) == null;

      if (isSignedIn && context.mounted) {
        context.go(item.routePath);
        return;
      }

      if (context.mounted) {
        return SignInView.showModal(
          context: context,
          redirect: item.routePath,
        );
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: HomeBottomNavigationBar(
        currentLocation: routerState.uri.path,
        onTap: goTo,
      ),
    );
  }
}
