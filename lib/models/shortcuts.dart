import 'package:flutter/material.dart';

class Shortcut extends StatelessWidget {
  final IconData icon;
  final String name;
  final String route;
  const Shortcut(this.icon, this.name, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            alignment: Alignment.center,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))))),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              name,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

enum AvailableShortcuts {
  jlu('吉大官网', Icons.school, "https://www.jlu.edu.cn/"),
  math('数学学院', Icons.numbers, "https://math.jlu.edu.cn/"),
  foreign('外国语学院', Icons.language, "https://foreign.jlu.edu.cn/"),
  computer('计算机学院', Icons.computer, "https://cs.jlu.edu.cn/"),
  public('公共外交学院', Icons.public, "https://gjwjjxy.jlu.edu.cn/"),
  ai('人工智能学院', Icons.science, "https://ai.jlu.edu.cn/"),
  literature('文学院', Icons.book, "https://wenxue.jlu.edu.cn/"),
  developing('正在开发', Icons.construction, "https://www.jlu.edu.cn/"),
  ;

  final IconData icon;
  final String name;
  final String route;
  const AvailableShortcuts(this.name, this.icon, this.route);
}

extension AvailableShortcutsExtension on AvailableShortcuts {
  Shortcut get shortcut => Shortcut(icon, name, route);
}

class ShortcutsModel with ChangeNotifier {
  List<AvailableShortcuts> _shortcuts = [
    AvailableShortcuts.jlu,
    AvailableShortcuts.math,
    AvailableShortcuts.foreign,
    AvailableShortcuts.computer,
    AvailableShortcuts.public,
    AvailableShortcuts.ai,
    AvailableShortcuts.literature,
    AvailableShortcuts.developing,
  ];
  List<Widget> get shortcutsInWidget =>
      _shortcuts.map((e) => e.shortcut).toList();
  List<AvailableShortcuts> get shortcuts => _shortcuts;
  set shortcuts(List<AvailableShortcuts> shortcuts) {
    _shortcuts = shortcuts;
    notifyListeners();
  }
}
