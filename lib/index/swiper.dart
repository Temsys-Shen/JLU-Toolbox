import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart' as swiper_view;
import '../models/swiper_pages.dart';

class Swiper extends StatelessWidget {
  const Swiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<SwiperPagesModel>(
            builder: (ctx, pages, child) {
              return swiper_view.Swiper.children(
                  pagination: const swiper_view.SwiperPagination(),
                  children: pages.pagesInWidget);
            },
          )),
    ));
  }
}
