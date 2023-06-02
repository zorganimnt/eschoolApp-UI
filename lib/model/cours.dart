class CoursModel {

  String? titleCours;
  String? descriptionCours;
  String? supportCours;
  
   CoursModel({this.titleCours, this.descriptionCours, this.supportCours});

   CoursModel.fromJson(Map<String, dynamic> json) {
    titleCours = json[' Formateur_lastname'];
    descriptionCours = json[' Formateur_name'];
    supportCours = json[' Formateur_mail'];
    print(descriptionCours); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[' Formateur_name'] = titleCours;
    data[' Formateur_lastname'] = descriptionCours;
    data[' Formateur_phone'] = supportCours;
    return data;
  }
}
