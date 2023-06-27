
// ignore_for_file: prefer_collection_literals

class ImagensModel {
  String? type;
  String? url;
  String? descricao;

  ImagensModel({this.type, this.url, this.descricao});

  ImagensModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['url'] = url;
    data['descricao'] = descricao;
    return data;
  }
}