import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';

class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    this.dialogContext,
    required this.redirect,
  });

  final String redirect;
  final BuildContext? dialogContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            10.h,
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign In'),
              ),
            ),
          ],
        ).padding(
          const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
