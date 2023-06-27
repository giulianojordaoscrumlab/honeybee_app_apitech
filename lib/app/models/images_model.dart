// ignore_for_file: prefer_collection_literals

class ImagesModel {
  String? front;
  String? back;

  ImagesModel({this.front, this.back});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    front = json['front'];
    back = json['back'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['front'] = front;
    data['back'] = back;
    return data;
  }
}
