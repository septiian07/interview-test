import 'package:json_annotation/json_annotation.dart';

part 'core_res_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResList<T> {
  int? status;
  String? message;
  List<T>? data;

  CoreResList({
    this.status,
    this.message,
    this.data,
  });

  factory CoreResList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResListToJson(this, toJsonT);
}
