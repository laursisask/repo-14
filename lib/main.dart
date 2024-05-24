import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'package:zeta_flutter_template/src/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext _) {
    return ZetaProvider(
      initialThemeData: ZetaThemeData(
        colorsDark: ZetaColors.dark(
            // TODO(Theme): Add custom color pallete
            ),
        colorsLight: ZetaColors.light(
            // TODO(Theme): Add custom color pallete
            ),
      ),
      builder: (context, themeData, themeMode) {
        final dark = themeData.colorsDark.toScheme();
        final light = themeData.colorsLight.toScheme();
        return MaterialApp.router(
          routerConfig: goRouter,
          themeMode: themeMode,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: themeData.fontFamily,
            scaffoldBackgroundColor: light.surfaceTertiary,
            colorScheme: light,
            textTheme: zetaTextTheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: themeData.fontFamily,
            scaffoldBackgroundColor: dark.surfaceTertiary,
            colorScheme: dark,
            textTheme: zetaTextTheme,
          ),
        );
      },
    );
  }
}
