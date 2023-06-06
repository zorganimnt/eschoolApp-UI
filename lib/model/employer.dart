class EmployerModel {

  String? nameEmployer;
  String? lastnameEmployer;
  String? emailEmployer;
  String? phoneEmployer;

   EmployerModel({this.lastnameEmployer, this.nameEmployer, this.phoneEmployer, this.emailEmployer});

   EmployerModel.fromJson(Map<String, dynamic> json) {
    lastnameEmployer = json[' Employer_lastname'];
    nameEmployer = json[' Employer_name'];
    emailEmployer = json[' Employer_mail'];
    phoneEmployer = json[' Employer_phone'];
   
    print(nameEmployer); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[' Employer_name'] = nameEmployer;
    data[' Employer_lastname'] = lastnameEmployer;
    data[' Employer_phone'] = phoneEmployer;
    data[' Employer_mail'] = emailEmployer;
    return data;
  }
}
