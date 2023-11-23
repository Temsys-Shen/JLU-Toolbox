import 'package:flutter/material.dart';
import 'package:jlu_toolbox/models/user_profile.dart';
import 'package:provider/provider.dart';

class MainAppBar extends AppBar {
  final BuildContext context;

  MainAppBar(this.context, {Key? key})
      : super(
            key: key,
            title: const Text(
              'JLU Toolbox',
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const SettingsPage()),
                  // );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileDialog(),
                  );
                },
              ),
            ]);
}

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key});

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  //用户名
  String? _username;
  //密码
  String? _password;

  @override
  void initState() {
    super.initState();
    _username =
        Provider.of<CurrentUser>(context, listen: false).userProfile.username;
    _password =
        Provider.of<CurrentUser>(context, listen: false).userProfile.password;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('填写个人信息'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              style: TextStyle(color: Colors.grey, fontSize: 12),
              "您的账号密码仅用于登录吉大统一身份验证，会被安全地加密保存在本地。"),
          const Text('用户名'),
          TextField(
            //初始值
            controller: TextEditingController(text: _username),
            onChanged: (value) {
              _username = value;
            },
            decoration: const InputDecoration(
                hintText: '吉大邮箱@前面的部分',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          const Text('密码'),
          TextField(
            controller: TextEditingController(text: _password),
            onChanged: (value) {
              _password = value;
            },
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('取消')),
        TextButton(
            onPressed: () {
              if (_username == null || _password == null) {
                Navigator.pop(context);
                return;
              }
              Provider.of<CurrentUser>(context, listen: false).userProfile =
                  UserProfile(_username!, _password!);
              Navigator.pop(context);
            },
            child: const Text('确定')),
      ],
    );
  }
}
