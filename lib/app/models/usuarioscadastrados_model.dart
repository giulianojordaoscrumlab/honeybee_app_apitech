// ignore_for_file: prefer_collection_literals

class UsuariosCadastradosModel {
  String? userId;
  String? fullname;
  bool? principal;

  UsuariosCadastradosModel({this.userId, this.fullname, this.principal});

  UsuariosCadastradosModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    principal = json['principal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['principal'] = principal;
    return data;
  }
}