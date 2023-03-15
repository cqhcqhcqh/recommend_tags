// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HashTagsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HashTag _$HashTagFromJson(Map<String, dynamic> json) => HashTag(
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$HashTagToJson(HashTag instance) => <String, dynamic>{
      'tag': instance.tag,
    };

HashTags _$HashTagsFromJson(Map<String, dynamic> json) => HashTags(
      tags: (json['tags'] as List<dynamic>)
          .map((e) => HashTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HashTagsToJson(HashTags instance) => <String, dynamic>{
      'tags': instance.tags,
    };
