

class ParentModel {

  String? nameParent;
  String? lastnameParent;
  String? emailParent;
  String? phoneParent;
 String? emailchild;
  ParentModel({this.lastnameParent, this.nameParent, this.phoneParent, this.emailParent, this.emailchild});

  ParentModel.fromJson(Map<String, dynamic> json) {
    lastnameParent = json['parent_lastname'];
    nameParent = json['parent_name'];
    emailParent = json['parent_mail'];
    phoneParent = json['parent_phone'];
    emailchild = json['child_mail'];
    print(nameParent); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_name'] = nameParent;
    data['parent_lastname'] = lastnameParent;
    data['parent_phone'] = phoneParent;
    data['child_mail'] = emailchild;
    return data;
  }
}
