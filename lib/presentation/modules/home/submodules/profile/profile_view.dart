import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
