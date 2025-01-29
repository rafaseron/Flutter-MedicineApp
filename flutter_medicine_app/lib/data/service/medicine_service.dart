import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_medicine_app/domain/model/medication.dart';
import 'package:result_dart/result_dart.dart';

class MedicineService {
  final baseUrl = "https://pocketbase.seronsoftware.com";

  Future<Result<int>> addMedicineRegister(Medication body) async {
    const endpoint = "/api/collections/medicine/records";
    final url = Uri.parse(baseUrl + endpoint);
    final header = {'Content-Type': 'application/json'};
    final encodedBody = jsonEncode(body);

    final response = await http.post(url, headers: header, body: encodedBody);
    final statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return Success(statusCode);
      default:
        return Failure(Exception("Error"));
    }
  }

  Future<List<Medication>> getAllMedicine() async {
    const endpoint = "/api/collections/medicine/records";
    final url = Uri.parse(baseUrl + endpoint);
    final header = {'Content-Type': 'application/json'};

    final respose = await http.get(url, headers: header);
    final decodedResponse = jsonDecode(respose.body);
    return decodedResponse;
  }

  Future<Result<int>> deleteMedicine(String id) async {
    final endpoint = "/api/collections/medicine/records/$id";
    final url = Uri.parse(baseUrl + endpoint);
    final header = {'Content-Type': 'application/json'};
    final response = await http.delete(url, headers: header);
    final statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return Success(statusCode);
      default:
        return Failure(Exception("Error"));
    }
  }

  Future<Result<int>> updateMedicine(String id, Medication body) async {
    final endpoint = "/api/collections/medicine/records/$id";
    final url = Uri.parse(baseUrl + endpoint);
    final header = {'Content-Type': 'application/json'};
    final encodedBody = jsonEncode(body);
    final response = await http.patch(url, headers: header, body: encodedBody);
    final statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return Success(statusCode);
      default:
        return Failure(Exception("Error"));
    }
  }
}
