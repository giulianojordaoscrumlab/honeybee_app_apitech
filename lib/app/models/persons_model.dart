// ignore_for_file: prefer_collection_literals

import 'package:honeybee/app/models/assinaturas_model.dart';
import 'package:honeybee/app/models/documentos_model.dart';
import 'package:honeybee/app/models/enderecos_model.dart';
import 'package:honeybee/app/models/imagens_model.dart';
import 'package:honeybee/app/models/redessociais_model.dart';
import 'package:honeybee/app/models/telefones_model.dart';
import 'package:honeybee/app/models/usuarioscadastrados_model.dart';
import 'package:honeybee/app/models/wallets_model.dart';

class PersonsModel {
  Id? iId;
  String? type;
  String? sComment;
  String? nomeCompleto;
  List<DocumentosModel>? documentos;
  List<EnderecosModel>? enderecos;
  List<TelefonesModel>? telefones;
  List<RedesSociaisModel>? redesSociais;
  List<ImagensModel>? imagens;
  List<UsuariosCadastradosModel>? usuariosCadastrados;
  List<AssinaturasModel>? assinaturas;
  WalletModel? wallet;

  PersonsModel(
      {this.iId,
      this.type,
      this.sComment,
      this.nomeCompleto,
      this.documentos,
      this.enderecos,
      this.telefones,
      this.redesSociais,
      this.imagens,
      this.usuariosCadastrados,
      this.assinaturas,
      this.wallet});

  PersonsModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    type = json['type'];
    sComment = json['__comment'];
    nomeCompleto = json['nome_completo'];
    if (json['documentos'] != null) {
      documentos = <DocumentosModel>[];
      json['documentos'].forEach((v) {
        documentos!.add(DocumentosModel.fromJson(v));
      });
    }
    if (json['enderecos'] != null) {
      enderecos = <EnderecosModel>[];
      json['enderecos'].forEach((v) {
        enderecos!.add(EnderecosModel.fromJson(v));
      });
    }
    if (json['telefones'] != null) {
      telefones = <TelefonesModel>[];
      json['telefones'].forEach((v) {
        telefones!.add(TelefonesModel.fromJson(v));
      });
    }
    if (json['redes_sociais'] != null) {
      redesSociais = <RedesSociaisModel>[];
      json['redes_sociais'].forEach((v) {
        redesSociais!.add(RedesSociaisModel.fromJson(v));
      });
    }
    if (json['imagens'] != null) {
      imagens = <ImagensModel>[];
      json['imagens'].forEach((v) {
        imagens!.add(ImagensModel.fromJson(v));
      });
    }
    if (json['usuarios_cadastrados'] != null) {
      usuariosCadastrados = <UsuariosCadastradosModel>[];
      json['usuarios_cadastrados'].forEach((v) {
        usuariosCadastrados!.add(UsuariosCadastradosModel.fromJson(v));
      });
    }
    if (json['assinaturas'] != null) {
      assinaturas = <AssinaturasModel>[];
      json['assinaturas'].forEach((v) {
        assinaturas!.add(AssinaturasModel.fromJson(v));
      });
    }
    wallet =
        json['wallet'] != null ? WalletModel.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['type'] = type;
    data['__comment'] = sComment;
    data['nome_completo'] = nomeCompleto;
    if (documentos != null) {
      data['documentos'] = documentos!.map((v) => v.toJson()).toList();
    }
    if (enderecos != null) {
      data['enderecos'] = enderecos!.map((v) => v.toJson()).toList();
    }
    if (telefones != null) {
      data['telefones'] = telefones!.map((v) => v.toJson()).toList();
    }
    if (redesSociais != null) {
      data['redes_sociais'] = redesSociais!.map((v) => v.toJson()).toList();
    }
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    if (usuariosCadastrados != null) {
      data['usuarios_cadastrados'] =
          usuariosCadastrados!.map((v) => v.toJson()).toList();
    }
    if (assinaturas != null) {
      data['assinaturas'] = assinaturas!.map((v) => v.toJson()).toList();
    }
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$oid'] = oid;
    return data;
  }
}
