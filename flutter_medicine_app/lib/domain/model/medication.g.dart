// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
      id: json['id'] as String?,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      date: json['date'] as String?,
      finishedStatus: json['finished_status'] as bool?,
      annotation: json['annotation'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MedicationToJson(Medication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'date': instance.date,
      'finished_status': instance.finishedStatus,
      'annotation': instance.annotation,
      'image': instance.image,
    };
