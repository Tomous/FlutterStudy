import 'package:json_annotation/json_annotation.dart';
import "githubUser.dart";
import "githubCacheConfig.dart";
part 'githubProfile.g.dart';

@JsonSerializable()
class GithubProfile {
  GithubProfile();

  late GithubUser user; //Github账号信息，结构见"githubUser.json"
  String? token; // 登录用户的token(oauth)或密码
  late num theme; //主题索引
  GithubCacheConfig? cache; // 缓存策略信息，结构见"githubCacheConfig.json"
  String? lastLogin; //最近一次的注销登录的用户名
  late String locale; // APP语言信息

  factory GithubProfile.fromJson(Map<String, dynamic> json) =>
      _$GithubProfileFromJson(json);
  Map<String, dynamic> toJson() => _$GithubProfileToJson(this);
}
