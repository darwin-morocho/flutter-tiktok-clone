import 'package:flutter/material.dart';

import '../../reels/view/reels_view.dart';

class UserView extends StatelessWidget {
  const UserView({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: ReelsView(tag: userId),
      ),
    );
  }
}
