import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../guards/auth_guard.dart';

class MessagesRoute {
  static const path = '/messages';
  static const name = 'Messages';

  static get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: authGuard,
      builder: (_, state) => const Material(
        child: Center(
          child: Text('Messages'),
        ),
      ),
    );
  }
}
