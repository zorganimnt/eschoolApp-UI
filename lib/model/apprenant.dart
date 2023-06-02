class StudentModel {
  
  String? nameStudent;
  String? lastnameStudent;
  String? emailStudent;
  String? phoneStudent;
  String? univerStudent;
  String? birthStudent;
  String? degreeStudent;
  

  StudentModel(
      {this.lastnameStudent,
      this.degreeStudent,
      this.emailStudent,
      this.nameStudent,
      this.phoneStudent,
      this.birthStudent,
      
      this.univerStudent});

  
  StudentModel.fromJson(Map<String, dynamic> json) {
    lastnameStudent = json['student_lastname'];
    nameStudent = json['student_name'];
    phoneStudent = json['student_phone'];
    emailStudent = json['student_mail'];
    univerStudent = json['student_university'];
    birthStudent = json['student_birth'];
    degreeStudent = json['student_degree'];
    

    
  }

  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_lasname'] = lastnameStudent;
    data['student_name'] = nameStudent;
    data['student_mail'] = emailStudent;
    data['student_phone'] = phoneStudent;
    data['student_degree'] = degreeStudent;
    data['student_birth'] = birthStudent;
    
    return data;
  }
}
