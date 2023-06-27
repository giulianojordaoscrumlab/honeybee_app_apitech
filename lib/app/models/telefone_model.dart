// ignore_for_file: prefer_collection_literals

class TelefoneModel {
  String? pais;
  String? ddd;
  String? numero;

  TelefoneModel({this.pais, this.ddd, this.numero});

  TelefoneModel.fromJson(Map<String, dynamic> json) {
    pais = json['pais'];
    ddd = json['ddd'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pais'] = pais;
    data['ddd'] = ddd;
    data['numero'] = numero;
    return data;
  }
}
