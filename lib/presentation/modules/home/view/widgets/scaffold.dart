import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/guards/auth_guard.dart';
import '../../../sign_in/view/sign_in_view.dart';
import 'bottom_navigation_bar.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    Future<void> goTo(HomeBottomNavigationBarItem item) async {
      final redirect = await authGuard(context, state);
      if (!context.mounted) {
        return;
      }
      if (redirect == null) {
        context.go(item.routePath);
        return;
      }

      SignInView.showModal(
        context: context,
        redirect: item.routePath,
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: HomeBottomNavigationBar(
        currentLocation: '',
        onTap: goTo,
      ),
    );
  }
}
