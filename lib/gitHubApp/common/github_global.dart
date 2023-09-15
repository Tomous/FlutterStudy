///全局变量-Global类    它主要管理APP的全局变量
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study/gitHubApp/cache_object.dart';
import 'package:flutter_study/gitHubApp/github_http.dart';
import 'package:flutter_study/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class GithubGlobal {
  static late SharedPreferences _preferences;
  static GithubProfile githubProfile = GithubProfile();
  //网络缓存对象
  static NetCache netCache = NetCache();

  //可选的主题列表
  static List<MaterialColor> get themes => _themes;

  //是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  // 初始化全局信息，会在app启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _preferences = await SharedPreferences.getInstance();
    var profile = _preferences.getString("profile");
    if (profile != null) {
      try {
        githubProfile = GithubProfile.fromJson(jsonDecode(profile));
      } catch (e) {
        print(e);
      }
    } else {
      //默认主题索引为0，代表蓝色
      githubProfile = GithubProfile()..theme = 0;
    }

    //如果没有缓存策略，设置默认缓存策略
    githubProfile.cache = githubProfile.cache ?? GithubCacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }

  //持久化Profile信息
  static saveProfile() =>
      _preferences.setString("profile", jsonEncode(githubProfile.toJson()));
}
