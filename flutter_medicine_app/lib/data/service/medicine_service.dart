import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_medicine_app/domain/model/medication.dart';
import 'package:result_dart/result_dart.dart';

class MedicineService {
  static final MedicineService _instance = MedicineService._();
  factory MedicineService() => _instance;

  MedicineService._();

  final baseUrl = "https://pocketbase.seronsoftware.com";

  Future<Result<int>> addMedicineRegister(Medication body) async {
    const endpoint = "/api/collections/medicine/records";
    final url = Uri.parse(baseUrl + endpoint);
    final header = {'Content-Type': 'application/json'};

    print('Enviando JSON: ${body.toJson()}'); // Log para debug

    try {
      final response = await http.post(
        url,
        headers: header,
        body: jsonEncode(body.toJson()),
      );

      print('Resposta da API: ${response.statusCode} - ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(response.statusCode);
      } else {
        return Failure(Exception('Erro HTTP ${response.statusCode}'));
      }
    } catch (e) {
      print('Erro na requisição: $e');
      return Failure(e as Exception);
    }
  }

  Future<List<Medication>> getAllMedicine() async {
    const endpoint = "/api/collections/medicine/records";
    final url =
        Uri.parse(baseUrl + endpoint + "?filter=(finished_status=false)");
    final header = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        // A API do PocketBase retorna os registros no campo 'items'
        final List<dynamic> items = decodedResponse['items'];

        return items.map((json) => Medication.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Erro ao buscar medicamentos: $e');
      return [];
    }
  }

  Future<List<Medication>> getAllMedicineFinishedStatus() async {
    const endpoint = "/api/collections/medicine/records";
    final url =
        Uri.parse(baseUrl + endpoint + "?filter=(finished_status=true)");
    final header = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        // A API do PocketBase retorna os registros no campo 'items'
        final List<dynamic> items = decodedResponse['items'];

        return items.map((json) => Medication.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Erro ao buscar medicamentos: $e');
      return [];
    }
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

// class MedicineServiceSingletonUsageExample {
//   final response = MedicineService().getAllMedicine();
// }
