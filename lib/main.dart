import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'package:zeta_flutter_template/src/utils/routes.dart';

// coverage:ignore-start
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
// coverage:ignore-end

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext _) {
    return ZetaProvider.base(
      //TODO: Add custom colors, fonts, etc.
      builder: (context, lightTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          routerConfig: goRouter,
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
