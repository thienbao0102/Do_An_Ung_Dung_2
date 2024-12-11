import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/ui_design/ui_design.dart';

class InitiaTrainModellWidget extends StatefulWidget {
  final Function(bool) onFileUploaded;
  const InitiaTrainModellWidget({Key? key, required this.onFileUploaded})
      : super(key: key);

  @override
  _InitiaTrainModellWidgetState createState() => _InitiaTrainModellWidgetState();
}

class _InitiaTrainModellWidgetState extends State<InitiaTrainModellWidget> {
  late DropzoneViewController _dropzoneController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 1000,
          height: 200,
          child: DropzoneView(
            onCreated: (DropzoneViewController controller) =>
                _dropzoneController = controller,
            onDropFile: _onDropFile,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.upload, size: 50, color: Colors.black),
              const SizedBox(height: 10),
              const Text(
                "Choose a file or drag & drop it here",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 5),
              const Text(
                "Please upload only one CSV file (max 50MB)",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: _pickFile,
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const AutoSizeText(
                  "BROWSE FILE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 16,
                ),
              ),
            ],
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
      widget.onFileUploaded(false);
    }
  }

  Future<void> _onDropFile(dynamic event) async {
    final name = await _dropzoneController.getFilename(event);
    final mime = await _dropzoneController.getFileMIME(event);
    final size = await _dropzoneController.getFileSize(event);

    if (mime == 'text/csv' && size <= 50 * 1024 * 1024) {
      // kiểm tra file CSV và kích thước <= 50MB
      GlobalData().fileName = name;
      final fileBytes = await _dropzoneController.getFileData(event);
      processFileBytes(fileBytes);
    } else {
      UiDesign.showToast("Invalid file type or size.");
      widget.onFileUploaded(false);
    }
  }

  void processFileBytes(Uint8List fileBytes) {
    String csvContent = utf8.decode(fileBytes);
    GlobalData().inputDataImport = CsvToListConverter().convert(csvContent);
    checkFileImport(GlobalData().inputDataImport);
    print(GlobalData().inputDataImport);
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
        "G2",
        "G3",
      ];

      List<dynamic> header = fields.first;
      List<String> fileColumns = header.map((col) => col.toString()).toList();

      bool hasAllRequiredColumns =
          requiredColumns.every((col) => fileColumns.contains(col));

      if (hasAllRequiredColumns) {
        widget.onFileUploaded(true);
      } else {
        UiDesign.showToast(
            "This file does not have all the necessary columns.");
      }
    }
  }
}
