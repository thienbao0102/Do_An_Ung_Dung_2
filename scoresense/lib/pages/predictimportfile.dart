import 'package:flutter/material.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/initial.dart';
import 'package:scoresense/module/uploadfile.dart';

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
          FormImportFile()
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
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFBFB),
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
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: fileUpload
                      ? const UploadFilegWidget()
                      : InitialWidget(onFileUploaded: handleFileUploaded),
                )),
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


