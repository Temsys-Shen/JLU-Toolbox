import 'package:flutter/material.dart';
import 'package:jlu_toolbox/components/test.dart';
import 'package:provider/provider.dart';
import 'app_bar.dart';
import 'models/swiper_pages.dart';
import 'index/index.dart' as index;
import 'models/user_profile.dart';

void main() {
  runApp(const AppWithProvider());
}

class AppWithProvider extends StatelessWidget {
  const AppWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => SwiperPages()),
          ChangeNotifierProvider(create: (ctx) => CurrentUser())
        ],
        child: MaterialApp(
          routes: {
            '/home': (context) => const index.Index(),
            '/login': (context) => const TestW(),
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
