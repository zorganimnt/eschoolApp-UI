
// hedhi mouch taw

class ParentModel {

  String? cinParent;
  String? nameParent;
  String? emailParent;
  String? phoneParent;

  ParentModel({this.cinParent, this.nameParent, this.phoneParent, this.emailParent});

  ParentModel.fromJson(Map<String, dynamic> json) {
    cinParent = json['parent_cin'];
    emailParent = json['parent_mail'];
    phoneParent = json['parent_phone'];
    nameParent = json['parent_name'];
    print(nameParent); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_name'] = nameParent;
    data['parent_mail'] = emailParent;
    data['parent_phone'] = phoneParent;
    data['parent_cin'] = cinParent;
    return data;
  }
}
