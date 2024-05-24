import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import 'package:zeta_flutter_template/src/pages/example.dart';
import 'package:zeta_flutter_template/src/pages/home.dart';

final homeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final exampleKey = GlobalKey<NavigatorState>(debugLabel: 'example');

final goRouter = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final showBottomBar = constraints.maxWidth < 479;
            return Scaffold(
              appBar: ZetaTopAppBar(
                title: const Text('My App'),
                leading: IconButton(
                  icon: const Icon(ZetaIcons.hamburger_menu_round),
                  onPressed: () {},
                ),
                actions: [
                  const Text('Dark Mode: '),
                  ZetaSwitch(
                    value: Zeta.of(context).brightness == Brightness.dark,
                    onChanged: (x) {
                      if (x != null) ZetaProvider.of(context).updateThemeMode(x ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ],
              ),
              body: showBottomBar
                  ? navigationShell
                  : Row(
                      children: [
                        ZetaNavigationRail(
                          onSelect: (value) => navigationShell.goBranch(value),
                          selectedIndex: state.fullPath == '/' ? 0 : 1,
                          items: const [
                            ZetaNavigationRailItem(label: 'Welcome', icon: Icon(ZetaIcons.content_round)),
                            ZetaNavigationRailItem(label: 'Example', icon: Icon(ZetaIcons.star_round)),
                          ],
                        ),
                        Expanded(child: navigationShell),
                      ],
                    ),
              bottomNavigationBar: showBottomBar
                  ? ZetaNavigationBar(
                      onTap: (value) => navigationShell.goBranch(value),
                      currentIndex: state.fullPath == '/' ? 0 : 1,
                      items: const [
                        ZetaNavigationBarItem(icon: ZetaIcons.content_round, label: 'Welcome'),
                        ZetaNavigationBarItem(icon: ZetaIcons.star_round, label: 'Example'),
                      ],
                    )
                  : null,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: exampleKey,
          routes: [
            GoRoute(
              path: '/example',
              pageBuilder: (context, state) => const MaterialPage(child: ExamplePage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
