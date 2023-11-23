import 'package:flutter/material.dart';
import 'package:jlu_toolbox/utils/auth_related.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfile {
  String username;
  String password;

  UserProfile(this.username, this.password);
}

class CurrentUser with ChangeNotifier {
  final UserProfile _userProfile = UserProfile("", "");
  final _storage = const FlutterSecureStorage();

  //实例化时从本地存储中读取用户信息
  CurrentUser() {
    (() async {
      final profile = await Future.wait(
          [_storage.read(key: "username"), _storage.read(key: "password")]);
      _userProfile.username = profile[0] ?? "";
      _userProfile.password = profile[1] ?? "";
      userProfile = _userProfile;
    })();
  }

  UserProfile get userProfile => _userProfile;
  set userProfile(UserProfile userProfile) {
    _storage.write(key: "username", value: userProfile.username);
    _storage.write(key: "password", value: userProfile.password);

    _userProfile.username = userProfile.username;
    _userProfile.password = userProfile.password;
    AuthRelated.userProfile = userProfile;
    notifyListeners();
  }
}
