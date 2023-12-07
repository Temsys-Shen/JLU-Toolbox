import 'package:flutter/material.dart';
import 'package:jlu_toolbox/components/test.dart';
import 'package:provider/provider.dart';
import 'app_bar.dart';
import 'index/index.dart' as index;
import 'web_browser/index.dart';
import 'models/swiper_pages.dart';
import 'models/user_profile.dart';
import 'models/shortcuts.dart';

void main() {
  runApp(const AppWithProvider());
}

class AppWithProvider extends StatelessWidget {
  const AppWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => SwiperPagesModel()),
          ChangeNotifierProvider(create: (ctx) => CurrentUserModel()),
          ChangeNotifierProvider(create: (ctx) => ShortcutsModel())
        ],
        child: MaterialApp(
          //自定义路由处理
          onGenerateRoute: (settings) {
            final uri = Uri.parse(settings.name!);
            if (uri.scheme == 'http' || uri.scheme == 'https') {
              debugPrint(settings.name!);
              return MaterialPageRoute(
                  builder: (context) => const WebBrowser(), settings: settings);
            }
            return null;
          },
          home: const MainApp(),
        ));
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Widget> _pages = [
    const index.Index(),
    const TestW(),
    const TestW(),
    const TestW(),
    const TestW(),
  ];
  final List<NavigationDestination> _destinations = [
    const NavigationDestination(
      label: '首页',
      icon: Icon(Icons.home),
    ),
    const NavigationDestination(
      label: '校内通知',
      icon: Icon(Icons.notifications),
    ),
    const NavigationDestination(
      label: '教务',
      icon: Icon(Icons.school),
    ),
    const NavigationDestination(
      label: '网址导航',
      icon: Icon(Icons.web),
    ),
    const NavigationDestination(
      label: 'JLUBOOK',
      icon: Icon(Icons.book),
    ),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context),
        body: _pages[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          destinations: _destinations,
          onDestinationSelected: (index) {
            setState(() {
              _index = index;
            });
          },
        ));
  }
}
