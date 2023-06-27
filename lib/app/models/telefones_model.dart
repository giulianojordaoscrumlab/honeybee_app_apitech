// ignore_for_file: prefer_collection_literals

import 'package:honeybee/app/models/dadosrecado_model.dart';
import 'package:honeybee/app/models/telefone_model.dart';

class TelefonesModel {
  String? type;
  bool? principal;
  bool? whatsapp;
  bool? sms;
  bool? recado;
  DadosRecadoModel? dadosRecado;
  TelefoneModel? telefone;

  TelefonesModel(
      {this.type,
      this.principal,
      this.whatsapp,
      this.sms,
      this.recado,
      this.dadosRecado,
      this.telefone});

  TelefonesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    principal = json['principal'];
    whatsapp = json['whatsapp'];
    sms = json['sms'];
    recado = json['recado'];
    dadosRecado = json['dados_recado'] != null
        ? DadosRecadoModel.fromJson(json['dados_recado'])
        : null;
    telefone = json['telefone'] != null
        ? TelefoneModel.fromJson(json['telefone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['principal'] = principal;
    data['whatsapp'] = whatsapp;
    data['sms'] = sms;
    data['recado'] = recado;
    if (dadosRecado != null) {
      data['dados_recado'] = dadosRecado!.toJson();
    }
    if (telefone != null) {
      data['telefone'] = telefone!.toJson();
    }
    return data;
  }
}
