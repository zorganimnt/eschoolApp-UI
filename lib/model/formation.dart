class FormationModel {

  String? titleFormation;
  String? categoryFormation;
  String? priceFormation;
  String? formateurFormation;
  String? dureeFormation;
  String? pictureFormation;
   FormationModel({this.titleFormation, this.categoryFormation, this.priceFormation, this.formateurFormation,this.dureeFormation, this.pictureFormation});

   FormationModel.fromJson(Map<String, dynamic> json) {
    titleFormation = json[' Formateur_lastname'];
    categoryFormation = json[' Formateur_name'];
    priceFormation = json[' Formateur_mail'];
    formateurFormation = json[' Formateur_phone'];
    dureeFormation = json[' Formateur_specialite'];
    pictureFormation= json[' Formateur_cv'];
    print(categoryFormation); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[' Formateur_name'] = titleFormation;
    data[' Formateur_lastname'] = categoryFormation;
    data[' Formateur_phone'] = priceFormation;
    data[' Formateur_mail'] = formateurFormation;
    data[' Formateur_specialite'] = dureeFormation;
    data[' Formateur_cv'] = pictureFormation;
    return data;
  }
}
