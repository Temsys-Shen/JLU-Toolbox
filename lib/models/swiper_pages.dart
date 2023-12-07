import 'package:flutter/material.dart';
import '../components/test.dart';
import '../components/qrcode.dart';
// import 'package:provider/provider.dart';

enum AvailableSwiperPages {
  qrcode("吉大码", Icons.qr_code, QRCode()),
  test("测试", Icons.qr_code, TestW()),
  ;

  final String label;
  final IconData icon;
  final Widget page;
  const AvailableSwiperPages(this.label, this.icon, this.page);
}

class SwiperPagesModel with ChangeNotifier {
  List<AvailableSwiperPages> _pages = [
    AvailableSwiperPages.qrcode,
    AvailableSwiperPages.test
  ];
  List<Widget> get pagesInWidget => _pages.map((e) => e.page).toList();
  List<AvailableSwiperPages> get pages => _pages;
  set pages(List<AvailableSwiperPages> pages) {
    _pages = pages;
    notifyListeners();
  }
}
