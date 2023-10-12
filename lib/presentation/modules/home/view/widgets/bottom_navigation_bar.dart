import 'package:flutter/material.dart';

enum HomeBottomNavigationBarItem {
  home,
  friends,
  messages,
  profile,
}

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.onTap,
  });

  final void Function(HomeBottomNavigationBarItem item) onTap;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    // Color getIconColor(String path) => routePath.startsWith(path) ? Colors.white : Colors.white38;
    Color getIconColor(String path) => Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: padding.bottom * 0.7,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => onTap(HomeBottomNavigationBarItem.home),
                  icon: Icon(
                    Icons.home_outlined,
                    // color: getIconColor(HomeRoute.path),
                  ),
                ),
                IconButton(
                  onPressed: () => onTap(HomeBottomNavigationBarItem.friends),
                  icon: Icon(
                    Icons.people_outline_rounded,
                    // color: getIconColor(FriendsRoute.path),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () => onTap(HomeBottomNavigationBarItem.messages),
                  icon: Icon(
                    Icons.message_outlined,
                    // color: getIconColor(MessagesRoute.path),
                  ),
                ),
                IconButton(
                  onPressed: () => onTap(HomeBottomNavigationBarItem.profile),
                  icon: Icon(
                    Icons.person_outline_rounded,
                    // color: getIconColor(ProfileRoute.path),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
