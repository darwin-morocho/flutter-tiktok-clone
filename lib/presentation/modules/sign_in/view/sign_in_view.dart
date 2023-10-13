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

  static Future<void> showModal({
    required BuildContext context,
    required String redirect,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SignInView(
          dialogContext: context,
          redirect: redirect,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (dialogContext != null)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 35,
                  ),
                ),
              ),
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

  Future<void> _signIn(BuildContext context) async {}
}
