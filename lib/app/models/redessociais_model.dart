// ignore_for_file: prefer_collection_literals

import 'package:honeybee/app/models/emails_model.dart';

class RedesSociaisModel {
  List<EmailsModel>? emails;
  String? facebook;
  String? instagram;
  String? twitter;

  RedesSociaisModel({this.emails, this.facebook, this.instagram, this.twitter});

  RedesSociaisModel.fromJson(Map<String, dynamic> json) {
    if (json['emails'] != null) {
      emails = <EmailsModel>[];
      json['emails'].forEach((v) {
        emails!.add(EmailsModel.fromJson(v));
      });
    }
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (emails != null) {
      data['emails'] = emails!.map((v) => v.toJson()).toList();
    }
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    return data;
  }
}
