// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerDate _$ServerDateFromJson(Map<String, dynamic> json) => ServerDate(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      created: DateTime.parse(json['created'] as String),
      id: json['id'] as String,
      nowDate: DateTime.parse(json['nowDate'] as String),
      text: json['text'] as String,
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ServerDateToJson(ServerDate instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'created': instance.created.toIso8601String(),
      'id': instance.id,
      'nowDate': instance.nowDate.toIso8601String(),
      'text': instance.text,
      'updated': instance.updated.toIso8601String(),
    };
