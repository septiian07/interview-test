// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      banner: json['banner'] as String?,
      logo: json['logo'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      playlist: (json['playlist'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'banner': instance.banner,
      'logo': instance.logo,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'playlist': instance.playlist,
    };
