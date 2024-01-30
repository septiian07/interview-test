import 'package:json_annotation/json_annotation.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'dir_id')
  int? dirId;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'created_at')
  String? created_at;

  @JsonKey(name: 'updated_at')
  String? updated_at;

  @JsonKey(name: 'file_exists')
  bool? fileExists;

  Playlist({
    this.id,
    this.dirId,
    this.title,
    this.description,
    this.url,
    this.type,
    this.created_at,
    this.updated_at,
    this.fileExists,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
