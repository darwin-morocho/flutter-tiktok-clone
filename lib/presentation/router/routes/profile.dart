import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../guards/auth_guard.dart';

class ProfileRoute {
  static const path = '/profile';
  static const name = 'Profile';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: authGuard,
      builder: (_, __) => Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile view'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
