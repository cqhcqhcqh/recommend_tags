import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HashTag {
  final String tag;
  HashTag({required this.tag});
  Map<String, dynamic> toJson() => _$TagToJson(this);
  factory HashTag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

HashTag _$TagFromJson(Map<String, dynamic> json) => HashTag(
      tag: json['name'] as String,
    );

Map<String, dynamic> _$TagToJson(HashTag instance) => <String, dynamic>{
      'name': instance.tag,
    };

@JsonSerializable()
class HashTags {
  final List<HashTag> tags;
  HashTags({required this.tags});
  factory HashTags.fromJson(List<Map<String, dynamic>> json) =>
      _$TagsFromJson(json);
}

HashTags _$TagsFromJson(List<Map<String, dynamic>> json) => HashTags(
      tags: json.map((e) => _$TagFromJson(e)).toList(),
    );
