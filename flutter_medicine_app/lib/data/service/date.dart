import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'date.g.dart';

String getNowDate() {
  final now = DateTime.now().toString().toDBModelData();
  return now;
}

extension ToDBModelData on String {
  String toDBModelData() {
    return '${this}Z';
  }
}

Future<String> getServerDate(String body) async {
  const stringUrl =
      "https://pocketbase.seronsoftware.com/api/collections/date/records/32mt14t494v2e37";
  final url = Uri.parse(stringUrl);
  final header = {'Content-Type': 'application/json'};
  final encodedBody = jsonEncode(body);
  final response = await http.patch(url, headers: header, body: encodedBody);
  final data = jsonDecode(response.body);
  final serverDate = ServerDate.fromJson(data);
  return serverDate.nowDate.toString();
}

@JsonSerializable()
class ServerDate {
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String id;
  final DateTime nowDate;
  final String text;
  final DateTime updated;

  ServerDate({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.nowDate,
    required this.text,
    required this.updated,
  });

  factory ServerDate.fromJson(Map<String, dynamic> json) =>
      _$ServerDateFromJson(json);
}
