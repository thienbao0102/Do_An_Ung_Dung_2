import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoresense/module/global_variable.dart';
import 'package:scoresense/module/header.dart';
import 'package:scoresense/module/import_file/initial.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(
            setColor: GlobalData().colorPrimary,
          ),
          Center(
            child: Container(
              width: 1050,
              //height: 400,
              margin: const EdgeInsets.only(
                  top: 140, left: 20, right: 20, bottom: 40),
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: DropdownMenu(
                        width: 150,
                        onSelected: (valueChoose) {
                          setState(() {
                            GlobalData().version = valueChoose!;
                          });
                        },
                        initialSelection: 1,
                        inputDecorationTheme: const InputDecorationTheme(),
                        dropdownMenuEntries: List.generate(
                          GlobalData().numModel - 1,
                          (index) => DropdownMenuEntry(
                            value: index + 1,
                            label: "Model_v${index + 1}",
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 25),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const AutoSizeText(
                          "Cancel",
                          style: TextStyle(
                              color: Color.fromARGB(221, 44, 44, 44),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          minFontSize: 10,
                          maxFontSize: 16,
                        ),
                      ),
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
                  )
                ],
              ),
            ),
          ),
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
