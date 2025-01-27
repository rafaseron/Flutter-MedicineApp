class Medication {
  final String name;
  final String dosage;
  final String date;
  final String finishedStatus;
  final String annotation;
  final String image;

  Medication({
    required this.name,
    required this.dosage,
    required this.date,
    required this.finishedStatus,
    required this.annotation,
    required this.image,
  });
}

// Formato da Data vindo da API:
// No calendário da Dashboard do DB usei: Dia 27/janeiro/2025 as 11:00
// "date": "2025-01-27 11:00:00.000Z",

