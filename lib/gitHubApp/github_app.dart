import 'package:flutter/material.dart';
import 'package:flutter_study/gitHubApp/common/github_global.dart';
import 'package:flutter_study/gitHubApp/demo_localization.dart';
import 'package:flutter_study/gitHubApp/profile_change_notifier.dart';
import 'package:flutter_study/models/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'github_http.dart';

///1、可以自动填充上次登录的用户名（如果有）
///2、为了防止密码输入错误，密码框应该有开关可以看明文
///3、用户名或密码字段在调用登录接口前有本地合法性校验（比如不能为空）
///4、登录成功后需更新用户信息
class GithubAppPage extends StatefulWidget {
  const GithubAppPage({super.key});

  @override
  State<GithubAppPage> createState() => _GithubAppPageState();
}

class _GithubAppPageState extends State<GithubAppPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;
  bool pwdShow = false;
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    _unameController.text = GithubGlobal.githubProfile.lastLogin ?? "";
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = DemoLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(gm.loginTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode
              .onUserInteraction, //控制表单字段在何时进行自动验证:用户与表单字段进行交互时执行验证
          child: Column(
            children: [
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: gm.userName,
                  hintText: gm.userNameHint,
                  prefixIcon: const Icon(Icons.person),
                ),
                //校验用户名
                validator: (value) {
                  return value == null || value.trim().isNotEmpty
                      ? null
                      : gm.userNameRequired;
                },
              ),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: gm.password,
                  hintText: gm.passwordHint,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      pwdShow ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          pwdShow = !pwdShow;
                        },
                      );
                    },
                  ),
                ),
                obscureText: !pwdShow,
                //校验密码
                validator: (value) {
                  return value == null || value.trim().isNotEmpty
                      ? null
                      : gm.passwordRequired;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    onPressed: _onLogin,
                    child: Text(gm.login),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      // 提交表单
      GithubUser? user;
      try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传入false，这样更新user后便不触发更新。
        // Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        print('dc---------$e');
        // if (e.response?.statusCode == 401) {
        Fluttertoast.showToast(
          msg: DemoLocalizations.of(context).userNameOrPasswordWrong +
              e.toString(),
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG,
        );
        // }
      } finally {
        Navigator.of(context).pop();
      }

      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    }
  }
}
