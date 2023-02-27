class StudentModel {
  // les varibles li bech nhotou fihom data li jeya men base
  // or data li bech naba3thouha lel base
  String? cinStudent;
  String? nameStudent;
  String? emailStudent;
  String? phoneStudent;
  String? univerStudent;
  String? specStudent;
  String? degreeStudent;
  String? parentStudent;

  StudentModel(
      {this.cinStudent,
      this.degreeStudent,
      this.emailStudent,
      this.nameStudent,
      this.phoneStudent,
      this.specStudent,
      this.parentStudent,
      this.univerStudent});

  // o hedhi njibou biha data w nhotouhom fi west varibale
  // jewna en façon json donc lazemni nbadelhom variable 3adiyin bech najem na9rahom
  StudentModel.fromJson(Map<String, dynamic> json) {
    cinStudent = json['student_cin'];
    nameStudent = json['student_name'];
    phoneStudent = json['student_phone'];
    emailStudent = json['student_mail'];
    univerStudent = json['student_university'];
    specStudent = json['student_speciality'];
    degreeStudent = json['student_degree'];
    parentStudent = json['student_parent'];

    //print(namestudent);
  }

  // hedhi bech naba3thou biha data li jebnehom men variable
  // hedhi bech nab3th variable li houma var mta3 model hatithom fel data pusique db metfhmch ken json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_name'] = nameStudent;
    data['student_mail'] = emailStudent;
    data['student_phone'] = phoneStudent;
    data['student_cin'] = cinStudent;
    data['student_degree'] = degreeStudent;
    data['student_speciality'] = specStudent;
    data['student_parent'] = parentStudent;
    return data;
  }
}
