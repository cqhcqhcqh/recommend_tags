import 'package:json_annotation/json_annotation.dart';
import '../Tools/HTTPClient.dart';
part 'TagCatesModel.g.dart';

@JsonSerializable()
class TagCates extends SimpleHTTPResponse {
  final List<TagCate> cates;
  TagCates({required this.cates});
  Map<String, dynamic> toJson() => _$TagCatesToJson(this);
  factory TagCates.fromJson(Map<String, dynamic> json) =>
      _$TagCatesFromJson(json);
}

@JsonSerializable()
class TagCate {
  final String name;
  TagCate({required this.name});
  Map<String, dynamic> toJson() => _$TagCateToJson(this);
  factory TagCate.fromJson(Map<String, dynamic> json) =>
      _$TagCateFromJson(json);
}
