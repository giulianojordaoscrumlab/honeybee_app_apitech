// ignore_for_file: prefer_collection_literals

class DadosRecadoModel {
  String? pessoaContato;
  String? vinculo;

  DadosRecadoModel({this.pessoaContato, this.vinculo});

  DadosRecadoModel.fromJson(Map<String, dynamic> json) {
    pessoaContato = json['pessoa_contato'];
    vinculo = json['vinculo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pessoa_contato'] = pessoaContato;
    data['vinculo'] = vinculo;
    return data;
  }
}
