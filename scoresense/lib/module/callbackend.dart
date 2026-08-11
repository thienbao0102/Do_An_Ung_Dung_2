import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoresense/config/api_config.dart';
import 'package:scoresense/module/predictions.dart';

const _requestTimeout = Duration(seconds: 120);

Future<List<Predictions>> sendData(
    List<List<dynamic>> inputDataImport, int version) async {
  final response = await http
      .post(
        apiUri('/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'version': version,
          'inputDataImport': inputDataImport,
        }),
      )
      .timeout(_requestTimeout);

  if (response.statusCode != 200) {
    throw Exception(_errorMessage(response));
  }

  final jsonResponse = jsonDecode(response.body);
  return (jsonResponse as List)
      .map((item) => Predictions.fromJson(item))
      .toList();
}

Future<int> getTotalModel() async {
  final response = await http.get(
    apiUri('/totalmodel'),
    headers: {'Content-Type': 'application/json'},
  ).timeout(_requestTimeout);

  if (response.statusCode != 200) {
    throw Exception(_errorMessage(response));
  }

  final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  return jsonResponse['numModel'] as int;
}

String _errorMessage(http.Response response) {
  try {
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return body['error']?.toString() ??
        'Request failed with status ${response.statusCode}.';
  } catch (_) {
    return 'Request failed with status ${response.statusCode}.';
  }
}
