import 'package:flutter/material.dart';
import 'package:flutter_medicine_app/data/service/medicine_service.dart';
import 'package:flutter_medicine_app/domain/model/medication.dart';

class AddViewmodel extends ChangeNotifier {
  Medication _medication = Medication(name: "", dosage: "", date: "");
  Medication get medication => _medication;

  bool _requestError = false;
  bool get requestError => _requestError;

  void changeFinishedStatus(bool finishedStatus) {
    _medication.finishedStatus = finishedStatus;
    notifyListeners();
  }

  void changeName(String name) {
    _medication.name = name;
    notifyListeners();
  }

  void changeDosage(String dosage) {
    _medication.dosage = dosage;
    notifyListeners();
  }

  void changeDate(String date) {
    _medication.date = null;
    notifyListeners();
  }

  void changeAnnotation(String? annotation) {
    _medication.annotation = annotation;
    notifyListeners();
  }

  void changeImage(String? image) {
    _medication.image = image;
    notifyListeners();
  }

  void changeRequestError(bool requestError) {
    _requestError = requestError;
    notifyListeners();
  }

  void createMedicationRegister() async {
    try {
      final response = await MedicineService().addMedicineRegister(_medication);
      if (response.isError()) {
        _requestError = true;
        notifyListeners();
      }
    } catch (e) {
      _requestError = true;
      notifyListeners();
    }
  }
}
