import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/presentation/components/medication_card.dart';
import 'package:flutter_medicine_app/presentation/ui/history_screen/history_viewmodel.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryViewmodel historyViewmodel = HistoryViewmodel();

  @override
  void initState() {
    super.initState();
    historyViewmodel.loadMedications();
  }

  @override
  Widget build(BuildContext context) {
    return _HistoryList(historyViewModel: historyViewmodel);
  }
}

class _HistoryList extends StatelessWidget {
  final HistoryViewmodel historyViewModel;

  const _HistoryList({required this.historyViewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: historyViewModel,
      builder: (context, _) {
        if (historyViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SizedBox(height: 50), // Espaçamento antes da lista
            Expanded(
              child: ListView.builder(
                itemCount: historyViewModel.medications.length,
                itemBuilder: (context, index) {
                  return MedicationCard(
                    medication: historyViewModel.medications[index],
                    isHistoryScreen: true,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
