// ignore_for_file: prefer_collection_literals

class WalletModel {
  String? id;

  WalletModel({this.id});

  WalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}
