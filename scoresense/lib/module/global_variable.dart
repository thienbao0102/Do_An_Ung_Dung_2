import 'package:flutter/material.dart';

class GlobalData {
  static final GlobalData _instance = GlobalData._internal();
  String fileName = '';

  //nội dung file csv import
  List<List<dynamic>> inputDataImport = List<List<dynamic>>.empty();

//index chuyen giua cac form
  ValueNotifier<int> indexedStackNotifier = ValueNotifier<int>(0);

  //bien data enter
  String fatherEducation = 'None';
  String motherEducation = 'None';
  String motherJob = 'At home';
  String fatherJob = 'At home';
  String parentStatus = 'Apart';
  String firstName = '';
  String lastName = '';
  String gender = 'Male';
  String location = 'Urban';
  String school = '';
  int age = 0;
  String schoolSupport = 'No';
  String familySupport = 'No';
  String paidClasses = 'No';
  String extracurricularActivities = 'No';
  String nurserySchool = 'No';
  String higherEducation = 'No';
  String internetAtHome = 'No';
  String relationship = 'No';
  int freeTimeIndex = 0;
  int travelTimeIndex = 0;
  int goOutIndex = 0;
  int workdayAlcohol = 0;
  int weekendAlcohol = 0;
  int currentHealth = 0;
  String familySize = "Greater than 3";
  int familyQuality = 0;
  int weeklyStudyTime = 0;
  int numOfFailClass = 0;


  // Private constructor
  GlobalData._internal();

  factory GlobalData() {
    return _instance;
  }
}
