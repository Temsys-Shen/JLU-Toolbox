import 'package:flutter/material.dart';
import 'package:jlu_toolbox/models/shortcuts.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class Shortcuts extends StatelessWidget {
  const Shortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShortcutsModel>(builder: (context, model, child) {
      return GridView.extent(
          maxCrossAxisExtent: 120, children: model.shortcutsInWidget);
    });
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
