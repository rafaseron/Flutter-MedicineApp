import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/presentation/components/medication_card.dart';
import 'package:flutter_medicine_app/presentation/viewmodel/medication_viewmodel.dart';

class MedicationScreen extends StatefulWidget {
  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  final MedicationViewModel medicationViewModel = MedicationViewModel();

  @override
  void initState() {
    super.initState();
    medicationViewModel.loadMedications();
  }

  @override
  Widget build(BuildContext context) {
    return _MedicationList(medicationViewModel: medicationViewModel);
  }
}

class _MedicationList extends StatelessWidget {
  final MedicationViewModel medicationViewModel;

  const _MedicationList({required this.medicationViewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: medicationViewModel,
      builder: (context, _) {
        if (medicationViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: medicationViewModel.medications.length,
          itemBuilder: (context, index) {
            return MedicationCard(
              medication: medicationViewModel.medications[index],
            );
          },
        );
      },
    );
  }
}
