import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';

class ImportFilePredict extends StatelessWidget {
  const ImportFilePredict({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Background_OtherPage.png'),
                fit: BoxFit.cover)),
        child: const Stack(
          children: [
            Positioned(
              top: 40,
              left: 120,
              child: Header(),
            ),
            FormImportFile() // Để nguyên FormImportFile nhưng chuyển thành StatelessWidget
          ],
        ),
    ));
  }
}

class FormImportFile extends StatefulWidget {
  const FormImportFile({super.key});

  @override
  _FormImportFileState createState() => _FormImportFileState();
}

class _FormImportFileState extends State<FormImportFile> {
  bool fileUpload = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1050,
        height: 380,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: fileUpload
                  ? const UploadingWidget()
                  : InitialWidget(onFileUploaded: handleFileUploaded), 
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý khi click Predict
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                backgroundColor: fileUpload
                    ? const Color(0xFF0062FF)
                    : const Color(0xFF7DAFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Predict",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleFileUploaded(bool uploaded) {
    setState(() {
      fileUpload = uploaded;
    });
  }
}

// Widget Initial chuyển thành StatefulWidget để quản lý trạng thái riêng
class InitialWidget extends StatefulWidget {
  final Function(bool) onFileUploaded;
  const InitialWidget({super.key, required this.onFileUploaded});

  @override
  _InitialWidgetState createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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

    setState(() {
      if (result != null) {
        widget.onFileUploaded(true);
      } else {
        widget.onFileUploaded(false);
      }
    });
  }
}

// Widget Uploading chuyển thành StatefulWidget để quản lý trạng thái
class UploadingWidget extends StatefulWidget {
  const UploadingWidget({super.key});

  @override
  _UploadingWidgetState createState() => _UploadingWidgetState();
}

class _UploadingWidgetState extends State<UploadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.insert_drive_file, size: 50, color: Colors.green),
            const SizedBox(width: 10),
            Expanded(child: Text(GlobalData().fileName)),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: GlobalData().progress),
        const SizedBox(height: 5),
        Text(
            'Uploading... ${(GlobalData().progress * 100).toStringAsFixed(0)}%'),
      ],
    );
  }
}
