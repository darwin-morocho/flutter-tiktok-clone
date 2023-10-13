import 'package:flutter/material.dart';

import 'global/colors.dart';
import 'modules/home/view/widgets/scaffold.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScaffold(
        child: Placeholder(),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.dark,
        primaryColorDark: AppColors.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.dark,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.blue,
        ),
        canvasColor: AppColors.dark,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.blue),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
    );
  }
}
