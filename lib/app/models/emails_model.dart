// ignore_for_file: prefer_collection_literals

class EmailsModel {
  String? endereco;
  bool? principal;
  bool? ativo;
  bool? deleted;

  EmailsModel({this.endereco, this.principal, this.ativo, this.deleted});

  EmailsModel.fromJson(Map<String, dynamic> json) {
    endereco = json['endereco'];
    principal = json['principal'];
    ativo = json['ativo'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['endereco'] = endereco;
    data['principal'] = principal;
    data['ativo'] = ativo;
    data['deleted'] = deleted;
    return data;
  }
}
