import 'package:json_annotation/json_annotation.dart';

part 'githubCacheConfig.g.dart';

@JsonSerializable()
class GithubCacheConfig {
  GithubCacheConfig();

  late bool enable; // 是否启用缓存
  late num maxAge; // 缓存的最长时间，单位（秒）
  late num maxCount; // 最大缓存数

  factory GithubCacheConfig.fromJson(Map<String, dynamic> json) =>
      _$GithubCacheConfigFromJson(json);
  Map<String, dynamic> toJson() => _$GithubCacheConfigToJson(this);
}
