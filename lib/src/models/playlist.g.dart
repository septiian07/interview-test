// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as int?,
      dirId: json['dir_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      fileExists: json['file_exists'] as bool?,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'dir_id': instance.dirId,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'type': instance.type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'file_exists': instance.fileExists,
    };
