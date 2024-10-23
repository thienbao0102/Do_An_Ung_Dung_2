class GlobalData {
  static final GlobalData _instance = GlobalData._internal();
  String fileName = '';
  double progress = 0.0;

//index chuyen giua cac form
  int indexedStack = 0;


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
  String school = 'Van Lang University';
  String age = '';
  String schoolSupport = '';
  String familySupport = '';
  String paidClasses = '';
  String extracurricularActivities = '';
  int freeTimeIndex = 0;
  int travelTimeIndex = 0;
  int goOutIndex = 0;

  // Private constructor
  GlobalData._internal();

  factory GlobalData() {
    return _instance;
  }
}
