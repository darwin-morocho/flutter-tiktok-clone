import 'package:flutter/material.dart';
import 'package:flutter_meedu/screen_utils.dart';

import '../../../../../domain/models/reel.dart';
import '../../../../extensions/extensions.dart';

class ReelActions extends StatelessWidget {
  const ReelActions({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    final avatarPhotoURL = reel.autor.photoURL;
    return SafeArea(
      child: Column(
        children: [
          CircleAvatar(
            foregroundImage:
                avatarPhotoURL != null ? NetworkImage(avatarPhotoURL) : null,
          ),
          30.h,
          ShadowView(
            child: Icon(
              reel.iLikeIt ? Icons.favorite : Icons.favorite_outline_rounded,
            ),
          ),
          ShadowView(
            child: Text(
              reel.likes.formatted,
              style: context.textTheme.labelSmall,
            ),
          ),
          30.h,
          const ShadowView(
            child: Icon(
              Icons.bookmark_outline,
            ),
          ),
          ShadowView(
            child: Text(
              reel.favorites.formatted,
              style: context.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class ShadowView extends StatelessWidget {
  const ShadowView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 2)
          ),
        ],
      ),
      child: child,
    );
  }
}
