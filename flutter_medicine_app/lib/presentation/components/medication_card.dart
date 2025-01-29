import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/domain/model/medication.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;

  const MedicationCard({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medication.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Dose: ${medication.dosage}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Horário: ${medication.date}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
