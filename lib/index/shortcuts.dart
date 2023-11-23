import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Shortcuts extends StatelessWidget {
  const Shortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(maxCrossAxisExtent: 120, children: [
      Shortcut(Icons.school, '吉大官网', () {}),
      Shortcut(Icons.numbers, '数学学院', () {}),
      Shortcut(Icons.language, '外国语学院', () {}),
      Shortcut(Icons.computer, '计算机学院', () {}),
      Shortcut(Icons.public, '公共外交学院', () {}),
      Shortcut(Icons.science, '人工智能学院', () {}),
      Shortcut(Icons.book, '文学院', () {}),
      Shortcut(Icons.construction, '正在开发', () {}),
    ]);
  }
}

class Shortcut extends StatelessWidget {
  final IconData icon;
  final String name;
  final void Function()? action;
  const Shortcut(this.icon, this.name, this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            alignment: Alignment.center,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))))),
        onPressed: action,
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
