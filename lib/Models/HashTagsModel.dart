import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'HashTagsModel.g.dart';

@JsonSerializable()
class HashTag {
  final String name;
  HashTag({required this.name});
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
  final int cost;
  final String _names;
  String get content => _names;
  HashTags({required List<HashTag> labels, required this.cost})
      : _names = labels.map((e) => "#${e.name}").toList().join(", ");

  factory HashTags.fromJson(Map<String, dynamic> json) =>
      _$HashTagsFromJson(json);
}

List<HashTags> allHashTagsFromJson(Map<String, dynamic> json) =>
    (json['tags'] as List<Map<String, dynamic>>)
        .map((e) => _$HashTagsFromJson(e))
        .toList();
