import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoresense/module/predictions.dart';

Future<List<Predictions>> sendData(
    List<List<dynamic>> inputDataImport, int version) async {
  // Chuyển đổi List thành JSON
  final jsonData = jsonEncode({
    "version": version,
    "inputDataImport": inputDataImport,
  });
  // Gửi yêu cầu POST lên server
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/predict'),
    headers: {"Content-Type": "application/json"},
    body: jsonData,
  );
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    // print(jsonResponse);
    // Chuyển đổi danh sách các bản ghi JSON thành danh sách các đối tượng Prediction
    List<Predictions> predictionsList = (jsonResponse as List)
        .map((item) => Predictions.fromJson(item))
        .toList();
    return predictionsList;
  }
  print('Failed to send data. Status code: ${response.statusCode}');
  return [];
}

Future<void> sendDataTrainModel(List<List<dynamic>> inputDataImport) async {
  // Chuyển đổi List thành JSON
  final jsonData = jsonEncode(inputDataImport);
  // print(jsonData);
  // Gửi yêu cầu POST lên server
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/trainmodel'),
    headers: {"Content-Type": "application/json"},
    body: jsonData,
  );
  if (response.statusCode == 200) {
    // final jsonResponse = jsonDecode(response.body);
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
    throw Exception('Failed to fetch data from server');
  }
}

Future<int> getTotalModel() async {
  // Gửi yêu cầu POST lên server
  final response = await http.get(
    Uri.parse('http://127.0.0.1:5000/totalmodel'),
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return jsonResponse['numModel'];
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
    throw Exception('Failed to fetch data from server');
  }
}
