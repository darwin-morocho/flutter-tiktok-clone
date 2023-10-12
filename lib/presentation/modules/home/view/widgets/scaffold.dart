import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(
        onTap: (item) {},
      ),
    );
  }
}
