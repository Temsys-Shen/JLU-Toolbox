import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jlu_toolbox/models/user_profile.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthRelated {
  static final _controller = WebViewController();
  static final _cookieManager = WebViewCookieManager();
  // ignore: unused_field
  static final _webview = WebViewWidget(
    controller: _controller,
  );
  static final _userProfile = UserProfile("", "");

  static set userProfile(UserProfile userProfile) {
    _userProfile.username = userProfile.username;
    _userProfile.password = userProfile.password;
    _controller.clearCache();
    _controller.clearLocalStorage();
    _cookieManager.clearCookies();
  }

  static Future<Image> getQRCode() async =>
      _getQRCode(_userProfile.username, _userProfile.password);

  static Future<Image> _getQRCode(String username, String pwd) async {
    const codeURL =
        "https://ehall.jlu.edu.cn/jlu_identitycode/IdentityCode_phone";
    final completer = Completer<Image>();
    if (username.isEmpty || pwd.isEmpty) {
      completer.completeError("用户名或密码为空");
      return completer.future;
    }

    _controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          if (url != codeURL) {
            String errormsg = (await _controller
                    .runJavaScriptReturningResult('\$("#errormsg").text()'))
                .toString();
            if (errormsg == "用户名密码错误" || errormsg == "验证码有误") {
              completer.completeError(errormsg);
              return;
            }
            await _controller.runJavaScript(
                '\$("#un").val("$username");\$("#pd").val("$pwd");login();'); //自动登录
          } else {
            //将网页中的二维码提取出来
            String qrcode = (await _controller.runJavaScriptReturningResult(
                    'document.getElementsByClassName("ma")[0].currentSrc'))
                .toString();
            try {
              completer.complete(Image.memory(
                base64Decode(qrcode.substring(qrcode.indexOf(",") + 1)),
              ));
            } on StateError {
              return;
            }
          }
        },
      ))
      ..loadRequest(Uri.parse(codeURL));

    return completer.future;
  }
}
