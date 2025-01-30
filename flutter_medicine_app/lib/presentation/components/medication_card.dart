import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/domain/model/medication.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;
  final VoidCallback onFinishClick = () {};
  final VoidCallback onDeleteClick = () {};
  final VoidCallback onEditClick = () {};

  bool isHistoryScreen = false;

  MedicationCard({
    super.key,
    required this.medication,
    this.isHistoryScreen = false,
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
            // Corrigido: removido as chaves do bloco if
            if (medication.finishedStatus != true)
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      onDeleteClick();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Excluir'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      onEditClick();
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  if (!isHistoryScreen)
                    TextButton.icon(
                      onPressed: () {
                        onFinishClick();
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Concluir'),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
