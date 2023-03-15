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
  final List<HashTag> labels;
  final int cost;
  HashTags({required this.labels, required this.cost});
  Map<String, dynamic> toJson() => _$HashTagsToJson(this);
  factory HashTags.fromJson(Map<String, dynamic> json) =>
      _$HashTagsFromJson(json);
  String allLabels() {
    return labels.map((e) => "#${e.name}").toList().join(", ");
  }
}

List<HashTags> allHashTagsFromJson(Map<String, dynamic> json) =>
    (json['tags'] as List<Map<String, dynamic>>)
        .map((e) => _$HashTagsFromJson(e))
        .toList();
