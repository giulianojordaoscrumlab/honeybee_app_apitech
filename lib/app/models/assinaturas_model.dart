// ignore_for_file: prefer_collection_literals

class AssinaturasModel {
  String? type;
  String? dataInicio;
  String? duracao;
  String? vencimento;
  String? pagamento;
  String? walletCard;

  AssinaturasModel(
      {this.type,
      this.dataInicio,
      this.duracao,
      this.vencimento,
      this.pagamento,
      this.walletCard});

  AssinaturasModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    dataInicio = json['data_inicio'];
    duracao = json['duracao'];
    vencimento = json['vencimento'];
    pagamento = json['pagamento'];
    walletCard = json['wallet_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['data_inicio'] = dataInicio;
    data['duracao'] = duracao;
    data['vencimento'] = vencimento;
    data['pagamento'] = pagamento;
    data['wallet_card'] = walletCard;
    return data;
  }
}
