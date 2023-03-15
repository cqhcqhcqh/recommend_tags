// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TagCatesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagCates _$TagCatesFromJson(Map<String, dynamic> json) => TagCates(
      cates: (json['cates'] as List<dynamic>)
          .map((e) => TagCate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagCatesToJson(TagCates instance) => <String, dynamic>{
      'cates': instance.cates,
    };

TagCate _$TagCateFromJson(Map<String, dynamic> json) => TagCate(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TagCateToJson(TagCate instance) => <String, dynamic>{
      'name': instance.name,
    };
