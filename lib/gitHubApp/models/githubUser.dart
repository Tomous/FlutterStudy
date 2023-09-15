import 'package:json_annotation/json_annotation.dart';

part 'githubUser.g.dart';

@JsonSerializable()
class GithubUser {
  GithubUser();

  late String login; //用户登录名
  late String avatar_url; //用户头像地址
  late String type; //用户类型，可能是组织
  String? name; //用户名字
  String? company; //公司
  String? blog; //博客地址
  String? location; // 用户所处地理位置
  String? email; // 邮箱
  bool? hireable;
  String? bio; // 用户简介
  late num public_repos; // 公开项目数
  late num followers; //关注该用户的人数
  late num following; // 该用户关注的人数
  late String created_at; // 账号创建时间
  late String updated_at; // 账号信息更新时间
  late num total_private_repos; //该用户总的私有项目数(包括参与的其他组织的私有项目)
  late num owned_private_repos; //该用户自己的私有项目数

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
  Map<String, dynamic> toJson() => _$GithubUserToJson(this);
}
