class FormateurModel {

  String? nameFormateur;
  String? lastnameFormateur;
  String? emailFormateur;
  String? phoneFormateur;
  String? specialiteFormateur;
  String? cvFormateur;
   FormateurModel({this.lastnameFormateur, this.nameFormateur, this.phoneFormateur, this.emailFormateur,this.specialiteFormateur,this.cvFormateur});

   FormateurModel.fromJson(Map<String, dynamic> json) {
    lastnameFormateur = json[' Formateur_lastname'];
    nameFormateur = json[' Formateur_name'];
    emailFormateur = json[' Formateur_mail'];
    phoneFormateur = json[' Formateur_phone'];
    specialiteFormateur = json[' Formateur_specialite'];
    cvFormateur= json[' Formateur_cv'];
    print(nameFormateur); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[' Formateur_name'] = nameFormateur;
    data[' Formateur_lastname'] = lastnameFormateur;
    data[' Formateur_phone'] = phoneFormateur;
    data[' Formateur_mail'] = emailFormateur;
    data[' Formateur_specialite'] = specialiteFormateur;
    data[' Formateur_cv'] = cvFormateur;
    return data;
  }
}
