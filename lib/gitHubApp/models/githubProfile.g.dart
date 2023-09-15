// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'githubProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubProfile _$GithubProfileFromJson(Map<String, dynamic> json) =>
    GithubProfile()
      ..user = GithubUser.fromJson(json['user'] as Map<String, dynamic>)
      ..token = json['token'] as String?
      ..theme = json['theme'] as num
      ..cache = json['cache'] == null
          ? null
          : GithubCacheConfig.fromJson(json['cache'] as Map<String, dynamic>)
      ..lastLogin = json['lastLogin'] as String?
      ..locale = json['locale'] as String;

Map<String, dynamic> _$GithubProfileToJson(GithubProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'theme': instance.theme,
      'cache': instance.cache,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
    };
