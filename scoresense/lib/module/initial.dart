import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design.dart';

class InitialWidget extends StatelessWidget {
  final Function(bool) onFileUploaded;
  const InitialWidget({super.key, required this.onFileUploaded});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.upload, size: 50, color: Colors.black),
        const SizedBox(height: 10),
        const Text(
          "Choose a file or drag & drop it here",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Please upload only one CSV file (max 50MB)",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: _pickFile,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "BROWSE FILE",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      GlobalData().fileName = result.files.single.name;
      Uint8List? fileBytes = result.files.single.bytes;
      processFileBytes(fileBytes!);
    } else {
      onFileUploaded(false);
    }
  }

  void processFileBytes(Uint8List fileBytes) {
    // Chuyển từ Uint8List sang chuỗi văn bản để đọc CSV
    String csvContent = utf8.decode(fileBytes);
    GlobalData().inputDataImport = CsvToListConverter().convert(csvContent);
    checkFileImport(GlobalData().inputDataImport);

    // Gọi mô hình dự đoán
    // runModel(modelInput);
  }

  void checkFileImport(List<List<dynamic>> fields) {
    if (fields.isNotEmpty) {
      List<String> requiredColumns = [
        "school",
        "sex",
        "age",
        "address",
        "famsize",
        "Pstatus",
        "Medu",
        "Fedu",
        "Mjob",
        "Fjob",
        "reason",
        "guardian",
        "traveltime",
        "studytime",
        "failures",
        "schoolsup",
        "famsup",
        "paid",
        "activities",
        "nursery",
        "higher",
        "internet",
        "romantic",
        "famrel",
        "freetime",
        "goout",
        "Dalc",
        "Walc",
        "health",
        "absences",
        "G1",
        "G2"
      ];

      // Lấy hàng đầu tiên làm header
      List<dynamic> header = fields.first;
      print("header");
      print(header);
      List<String> fileColumns = header.map((col) => col.toString()).toList();

      // Kiểm tra các cột có đầy đủ hay không
      bool hasAllRequiredColumns = 
      requiredColumns.every((col) => fileColumns.contains(col));

      if (hasAllRequiredColumns) {
        onFileUploaded(true);
      }
      else {
        UiDesign.showToast(
            "This file does not have all the necessary columns.");
      }
    }
  }
}
