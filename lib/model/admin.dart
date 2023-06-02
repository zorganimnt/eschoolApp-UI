class AdminModel {

  String? nameAdmin;
  String? lastnameAdmin;
  String? emailAdmin;
  String? phoneAdmin;

  AdminModel({this.lastnameAdmin, this.nameAdmin, this.phoneAdmin, this.emailAdmin});

  AdminModel.fromJson(Map<String, dynamic> json) {
    lastnameAdmin = json['admin_lastname'];
    nameAdmin = json['admin_name'];
    emailAdmin = json['admin_mail'];
    phoneAdmin = json['admin_phone'];
   
    print(nameAdmin); 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin_name'] = nameAdmin;
    data['admin_lastname'] = lastnameAdmin;
    data['admin_phone'] = phoneAdmin;
    data['admin_mail'] = emailAdmin;
    return data;
  }
}
