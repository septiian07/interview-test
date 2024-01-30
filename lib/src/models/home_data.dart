import 'package:interview_task/src/models/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'banner')
  String? banner;

  @JsonKey(name: 'logo')
  String? logo;

  @JsonKey(name: 'created_at')
  String? created_at;

  @JsonKey(name: 'updated_at')
  String? updated_at;

  @JsonKey(name: 'playlist')
  List<Playlist>? playlist;

  HomeData({
    this.id,
    this.title,
    this.description,
    this.banner,
    this.logo,
    this.created_at,
    this.updated_at,
    this.playlist,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
