// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'githubCacheConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubCacheConfig _$GithubCacheConfigFromJson(Map<String, dynamic> json) =>
    GithubCacheConfig()
      ..enable = json['enable'] as bool
      ..maxAge = json['maxAge'] as num
      ..maxCount = json['maxCount'] as num;

Map<String, dynamic> _$GithubCacheConfigToJson(GithubCacheConfig instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'maxAge': instance.maxAge,
      'maxCount': instance.maxCount,
    };
