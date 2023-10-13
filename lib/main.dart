import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    const MainApp(),
  );
}
