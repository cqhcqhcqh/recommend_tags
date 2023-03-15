import 'package:json_annotation/json_annotation.dart';
part 'HashTagsModel.g.dart';

@JsonSerializable()
class HashTag {
  final String tag;
  HashTag({required this.tag});
  Map<String, dynamic> toJson() => _$HashTagToJson(this);
  factory HashTag.fromJson(Map<String, dynamic> json) =>
      _$HashTagFromJson(json);
}

// HashTag _$TagFromJson(Map<String, dynamic> json) => HashTag(
//       tag: json['name'] as String,
//     );

// Map<String, dynamic> _$TagToJson(HashTag instance) => <String, dynamic>{
//       'name': instance.tag,
//     };

@JsonSerializable()
class HashTags {
  final List<HashTag> tags;
  HashTags({required this.tags});
  Map<String, dynamic> toJson() => _$HashTagsToJson(this);
  factory HashTags.fromJson(Map<String, dynamic> json) =>
      _$HashTagsFromJson(json);
}
