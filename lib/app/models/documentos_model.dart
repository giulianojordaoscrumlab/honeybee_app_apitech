// ignore_for_file: prefer_collection_literals

import 'package:honeybee/app/models/images_model.dart';

class DocumentosModel {
  String? type;
  String? numero;
  List<ImagesModel>? images;
  String? emissor;
  String? emissao;

  DocumentosModel(
      {this.type, this.numero, this.images, this.emissor, this.emissao});

  DocumentosModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    numero = json['numero'];
    if (json['images'] != null) {
      images = <ImagesModel>[];
      json['images'].forEach((v) {
        images!.add(ImagesModel.fromJson(v));
      });
    }
    emissor = json['emissor'];
    emissao = json['emissao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['numero'] = numero;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['emissor'] = emissor;
    data['emissao'] = emissao;
    return data;
  }
}
