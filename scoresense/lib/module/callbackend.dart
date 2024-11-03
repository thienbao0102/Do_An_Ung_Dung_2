import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> sendData(List<List<dynamic>> inputDataImport) async {
  //print(inputDataImport);
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
    return jsonResponse['predictions'];
  }
  print('Failed to send data. Status code: ${response.statusCode}');
  return [];
}
