import 'package:flutter/material.dart';

class GlobalData {
  static final GlobalData _instance = GlobalData._internal();
  String fileName = '';
  int version = 1;

  // Nội dung file csv import
  List<List<dynamic>> inputDataImport = List<List<dynamic>>.empty();

  // Index chuyển giữa các form
  ValueNotifier<int> indexedStackNotifier = ValueNotifier<int>(0);

  // Biến data enter
  int fatherEducation = 0;
  int motherEducation = 0;
  String motherJob = 'At_home';
  String fatherJob = 'At_home';
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
  int absences = 0;
  int G1 = 0;
  int G2 = 0;
  String reason = "Course";
  String guardian = "Mother";

  // Private constructor
  GlobalData._internal();

  factory GlobalData() {
    return _instance;
  }

  Color colorPrimary = const Color.fromARGB(255, 0, 98, 255);
  Color colorText = const Color.fromARGB(255, 51, 51, 51);

  // Hàm đặt lại tất cả về giá trị mặc định
  void resetValues() {
    fatherEducation = 0;
    motherEducation = 0;
    motherJob = 'At_home';
    fatherJob = 'At_home';
    parentStatus = 'Apart';
    firstName = '';
    lastName = '';
    gender = 'Male';
    location = 'Urban';
    school = '';
    age = 0;
    schoolSupport = 'No';
    familySupport = 'No';
    paidClasses = 'No';
    extracurricularActivities = 'No';
    nurserySchool = 'No';
    higherEducation = 'No';
    internetAtHome = 'No';
    relationship = 'No';
    freeTimeIndex = 0;
    travelTimeIndex = 0;
    goOutIndex = 0;
    workdayAlcohol = 0;
    weekendAlcohol = 0;
    currentHealth = 0;
    familySize = "Greater than 3";
    familyQuality = 0;
    weeklyStudyTime = 0;
    numOfFailClass = 0;
    indexedStackNotifier.value = 0; // Đặt lại chỉ số stack về 0
  }
}
