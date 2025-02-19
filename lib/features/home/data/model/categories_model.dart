import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesResponse {
  String? slug;
  String? name;
  String? url;

  CategoriesResponse({this.slug, this.name, this.url});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
