import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/blocs/session/session_bloc.dart';
import '../../../../router/routes/home.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile view'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              sessionProvider.read().logOut();
              context.go(HomeRoute.path);
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
