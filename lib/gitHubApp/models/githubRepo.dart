import 'package:json_annotation/json_annotation.dart';
import "githubUser.dart";
part 'githubRepo.g.dart';

@JsonSerializable()
class GithubRepo {
  GithubRepo();

  late num id;
  late String name; //项目名称
  // ignore: non_constant_identifier_names
  late String full_name; //项目完整名称
  late GithubUser owner; // 项目拥有者，结构见"githubUser.json"
  GithubRepo? parent; // 如果是fork的项目，则此字段表示fork的父项目信息
  late bool private; // 是否私有项目
  late String description; //项目描述
  late bool fork; // 该项目是否为fork的项目
  String? language; //该项目的主要编程语言
  late num forks_count; // fork了该项目的数量
  late num stargazers_count; //该项目的star数量
  late num size; // 项目占用的存储大小
  late String default_branch; //项目的默认分支
  late num open_issues_count; //该项目当前打开的issue数量
  late String pushed_at;
  late String created_at;
  late String updated_at;
  num? subscribers_count; //订阅（关注）该项目的人数
  Map<String, dynamic>? license; // 该项目的开源许可证

  factory GithubRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoFromJson(json);
  Map<String, dynamic> toJson() => _$GithubRepoToJson(this);
}
