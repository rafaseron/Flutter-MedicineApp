// medication_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/data/service/medicine_service.dart';
import 'package:flutter_medicine_app/domain/model/medication.dart';

class HistoryViewmodel with ChangeNotifier {
  List<Medication> _medications = [];
  bool _isLoading = false;

  List<Medication> get medications => _medications;
  bool get isLoading => _isLoading;

  Future<void> loadMedications() async {
    try {
      _isLoading = true;
      notifyListeners();

      _medications = await MedicineService().getAllMedicineFinishedStatus();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
