import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/initial.dart';
import 'package:scoresense/module/uploadfile.dart';
import 'package:scoresense/pages/resultpredictfileimport.dart';

class ImportFilePredict extends StatelessWidget {
  const ImportFilePredict({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Background_OtherPage.png'),
                  fit: BoxFit.cover)),
          child: const FormImportFile()),
    );
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 1050,
              //height: 400,
              margin: const EdgeInsets.only(
                  top: 140, left: 20, right: 20, bottom: 40),
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
                      if (fileUpload) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Resultpredictfileimport()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 25),
                      backgroundColor: fileUpload
                          ? const Color(0xFF0062FF)
                          : const Color(0xFF7DAFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const AutoSizeText(
                      "Predict",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      minFontSize: 10,
                      maxFontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: MediaQuery.of(context).size.width >= 500 ? 120 : 50,
              child: const Header()),
        ],
      ),
    );
  }

  void handleFileUploaded(bool uploaded) {
    setState(() {
      fileUpload = uploaded;
    });
  }
}
