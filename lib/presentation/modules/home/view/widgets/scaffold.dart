import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: child,
      bottomNavigationBar: HomeBottomNavigationBar(
        currentLocation: routerState.uri.path,
        onTap: (item) => context.go(item.routePath),
      ),
    );
  }
}
