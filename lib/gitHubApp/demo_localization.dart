import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

//Locale资源类
class DemoLocalizations {
  //是否为中文
  bool isZh = false;
  DemoLocalizations(this.isZh);
  //是否为中文
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  //是否为中文
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

  //github loginTitle
  String get loginTitle {
    return isZh ? "Github登陆" : "Github Login";
  }

  //github loginTitle
  String get userName {
    return isZh ? "用户名" : "username";
  }

  //github loginTitle
  String get userNameHint {
    return isZh ? "请输入用户名称" : "Please enter username";
  }

  String get userNameRequired {
    return isZh ? "用户名称不能为空" : "Username can not be empty";
  }

  String get password {
    return isZh ? "密码" : "password";
  }

  String get passwordHint {
    return isZh ? "请输入密码" : "Please enter password";
  }

  String get passwordRequired {
    return isZh ? "密码不能为空" : "Password can not be empty";
  }

  String get login {
    return isZh ? "登陆" : "Login";
  }

  String get userNameOrPasswordWrong {
    return isZh ? "登陆失败" : "Login failed";
  }
  //... 其他的值
}

//Locale代理类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == 'zh'));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}
