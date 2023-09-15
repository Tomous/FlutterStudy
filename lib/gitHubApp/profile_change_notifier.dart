import 'package:flutter/material.dart';
import 'package:flutter_study/gitHubApp/common/github_global.dart';
import 'package:flutter_study/models/index.dart';

///有了全局变量，我们还需要考虑如何跨组件共享状态。当然，如果我们将要共享的状态全部用全局变量替代也是可以的，
///但是这在Flutter开发中并不是一个好主意，因为组件的状态是和UI相关，而在状态改变时我们会期望依赖该状态的UI组件会自动更新，
///如果使用全局变量，那么我们必须得去手动处理状态变动通知、接收机制以及变量和组件依赖关系。
///因此，本实例中，我们使用前面介绍过的Provider包来实现跨组件状态共享，因此我们需要定义相关的Provider。
///在本实例中，需要共享的状态有登录用户信息、APP主题信息、APP语言信息。由于这些信息改变后都要立即通知其他依赖的该信息的Widget更新，
///所以我们应该使用ChangeNotifierProvider，另外，这些信息改变后都是需要更新Profile信息并进行持久化的。
///综上所述，我们可以定义一个ProfileChangeNotifier基类，然后让需要共享的Model继承自该类即可
class ProfileChangeNotifier extends ChangeNotifier {
  GithubProfile get _profile => GithubGlobal.githubProfile;

  @override
  void notifyListeners() {
    GithubGlobal.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

///用户状态
///用户状态在登录状态发生变化时更新、通知其依赖项
class UserModel extends ProfileChangeNotifier {
  GithubUser get user => _profile.user;

  //APP是否登陆(如果有用户信息，则证明登录过)
  // ignore: unnecessary_null_comparison
  bool get isLogin => user != null;
  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(GithubUser user) {
    if (user.login != _profile.user.login) {
      _profile.lastLogin = _profile.user.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

///APP主题状态
///主题状态在用户更换APP主题时更新、通知其依赖项，
class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => GithubGlobal.themes.firstWhere(
        // ignore: unrelated_type_equality_checks
        (element) => element == _profile.theme,
        orElse: () => Colors.blue,
      );
  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500]?.value as num;
      notifyListeners();
    }
  }
}

///APP语言状态
///当APP语言选为跟随系统（Auto）时，在系通语言改变时，APP语言会更新；
///当用户在APP中选定了具体语言时（美国英语或中文简体），则APP便会一直使用用户选定的语言，不会再随系统语言而变
class LocaleModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (_profile.locale == null) {
      return null;
    }
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  String get locale => _profile.locale;
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
