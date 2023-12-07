import 'package:flutter/material.dart';
import 'package:jlu_toolbox/models/user_profile.dart';
import 'package:provider/provider.dart';
import '../utils/auth_related.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserModel>(builder: (context, currentUser, child) {
      return FutureBuilder(
        future: AuthRelated().getQRCode(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return const Center(
              child: Text("登录后可显示吉大码"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? const Center(child: Text("吉大码获取失败"));
          } else {
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("正在获取吉大码"),
              ],
            ));
          }
        },
      );
    });
  }
}
