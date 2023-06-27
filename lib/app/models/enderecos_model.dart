// ignore_for_file: prefer_collection_literals

class EnderecosModel {
  String? type;
  bool? principal;
  String? rua;
  String? numero;
  String? bairro;
  String? cidade;
  String? estado;
  String? cep;
  String? complemento;
  String? quadra;
  String? lote;
  String? logradouro;
  String? uf;

  EnderecosModel(
      {this.type,
      this.principal,
      this.rua,
      this.numero,
      this.bairro,
      this.cidade,
      this.estado,
      this.cep, 
      this.complemento,
      this.quadra,
      this.lote, 
      this.logradouro,
      this.uf
      });


  EnderecosModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    principal = json['principal'];
    rua = json['rua'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    complemento = json['complemento'];
    quadra = json['quadra'];
    lote = json['lote'];
    uf = json['uf'];
    logradouro = json['logradouro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['principal'] = principal;
    data['rua'] = rua;
    data['numero'] = numero;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['cep'] = cep;
    data['complemento'] = complemento;
    data['quadra'] = quadra;
    data['lote'] = lote;
    data['uf'] = uf;
    data['logradouro'] = logradouro;
    return data;
  }
}