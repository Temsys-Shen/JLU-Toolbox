import 'package:flutter/material.dart';
import 'swiper.dart';
import 'shortcuts.dart' as msc;

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 4, child: Swiper()),
        Expanded(flex: 3, child: msc.Shortcuts())
      ],
    );
  }
}
