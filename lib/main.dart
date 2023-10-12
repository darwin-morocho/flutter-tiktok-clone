import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/modules/home/view/widgets/scaffold.dart';

void main() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScaffold(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff181C1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff181C1E),
          elevation: 0,
        ),
      ),
    );
  }
}
