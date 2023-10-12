import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/either.dart';
import '../../../extensions/extensions.dart';
import '../../../global/blocs/session_bloc.dart';

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
                onPressed: () => _signIn(context),
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

  Future<void> _signIn(BuildContext context) async {
    final result = await sessionProvider.read().signIn();

    if (!context.mounted) {
      return;
    }

    switch (result) {
      case Left _:

      /// show error message
      case Right _:
        if (dialogContext?.mounted ?? false) {
          Navigator.pop(dialogContext!);
        }
        context.go(redirect);
    }
  }
}
