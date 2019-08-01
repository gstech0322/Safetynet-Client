import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'config/theme/theme.dart';
import 'screens/home.dart';
import 'screens/onboarding.dart';

bool _onboarding;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Geolocator.checkPermission() != LocationPermission.always
      ? _onboarding = true
      : _onboarding = false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safteynet',
      theme: CustomTheme.lightTheme,
      home: _onboarding ? Onboarding() : Home(),
    );
  }
}
