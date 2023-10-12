import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/my_app.dart';
import 'presentation/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  Repositories.auth.setArguments(
    Faker(),
  );
  runApp(
    const MainApp(),
  );
}

