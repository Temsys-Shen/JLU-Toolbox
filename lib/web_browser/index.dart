import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBrowser extends StatelessWidget {
  const WebBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController();
    const codeURL =
        "https://ehall.jlu.edu.cn/jlu_identitycode/IdentityCode_phone";
    controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          if (url != codeURL) {
            await controller.runJavaScript(
                '\$("#un").val("shensc0322");\$("#pd").val("20020920ssc");login();'); //自动登录
          } else {
            debugPrint("====================================");
            debugPrint(url);
            //将网页中的二维码提取出来
            String qrcode = (await controller.runJavaScriptReturningResult(
                    'document.getElementsByClassName("ma")[0].currentSrc'))
                .toString();
            debugPrint(qrcode);
          }
        },
      ))
      ..loadRequest(Uri.parse(codeURL));
      WebViewWidget(
        controller: controller,
      );
    return Scaffold(
      appBar: AppBar(
        // 获取当前路由的名称
        title: Text(ModalRoute.of(context)!.settings.name!),
      ),
      body: const Center(
          child: Text("正在开发中...")
          ),
    );
  }
}
