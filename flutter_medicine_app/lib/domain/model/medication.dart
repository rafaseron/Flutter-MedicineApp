import 'package:json_annotation/json_annotation.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
  String? id;
  String name;
  String dosage;
  String? date; // Já deve estar no formato correto

  @JsonKey(name: 'finished_status')
  bool? finishedStatus;

  String? annotation;
  String? image;

  Medication({
    this.id,
    required this.name,
    required this.dosage,
    this.date,
    this.finishedStatus,
    this.annotation,
    this.image,
  });

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}

// Formato da Data vindo da API:
// No calendário da Dashboard do DB usei: Dia 27/janeiro/2025 as 11:00
// "date": "2025-01-27 11:00:00.000Z",

