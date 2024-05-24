import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(ZetaSpacing.m),
      child: Column(
        children: [
          ZetaInPageBanner(
            title: 'Welcome',
            content: Text(
              'This app is built with Zeta Flutter.\n\nTo learn more visit:\nhttps://pub.dev/packages/zeta_flutter',
            ),
          ),
        ],
      ),
    );
  }
}
