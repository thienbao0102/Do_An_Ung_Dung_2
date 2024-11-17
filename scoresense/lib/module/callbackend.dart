import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoresense/module/predictions.dart';

Future<List<Predictions>> sendData(List<List<dynamic>> inputDataImport) async {
  // Chuyển đổi List thành JSON
  final jsonData = jsonEncode(inputDataImport);

  // Gửi yêu cầu POST lên server
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/predict'),
    headers: {"Content-Type": "application/json"},
    body: jsonData,
  );
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);

    // Chuyển đổi danh sách các bản ghi JSON thành danh sách các đối tượng Prediction
    List<Predictions> predictionsList = (jsonResponse as List)
        .map((item) => Predictions.fromJson(item))
        .toList();
    return predictionsList;
  }
  print('Failed to send data. Status code: ${response.statusCode}');
  return [];
}

