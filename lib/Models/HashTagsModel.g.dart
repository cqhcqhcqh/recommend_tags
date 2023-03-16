// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HashTagsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HashTag _$HashTagFromJson(Map<String, dynamic> json) => HashTag(
      name: json['name'] as String,
    );

Map<String, dynamic> _$HashTagToJson(HashTag instance) => <String, dynamic>{
      'name': instance.name,
    };

HashTags _$HashTagsFromJson(Map<String, dynamic> json) => HashTags(
      labels: (json['labels'] as List<dynamic>)
          .map((e) => HashTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      cost: json['cost'] as int,
    );
