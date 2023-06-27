// ignore_for_file: prefer_collection_literals

class ModelMainMenu {
  Header? header;
  List<Buttons>? buttons;

  ModelMainMenu({this.header, this.buttons});

  ModelMainMenu.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['buttons'] != null) {
      buttons = <Buttons>[];
      json['buttons'].forEach((v) {
        buttons!.add(Buttons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (buttons != null) {
      data['buttons'] = buttons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Header {
  String? title;
  String? icon;

  Header({this.title, this.icon});

  Header.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}

class Buttons {
  String? icon;
  String? title;
  bool? route;
  String? namedRoute;
  String? function;
  bool? fullsize;
  bool? enabled;

  Buttons(
      {this.icon,
      this.title,
      this.route,
      this.namedRoute,
      this.function,
      this.fullsize,
      this.enabled});

  Buttons.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    route = json['route'];
    namedRoute = json['namedRoute'];
    function = json['function'];
    fullsize = json['fullsize'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['icon'] = icon;
    data['title'] = title;
    data['route'] = route;
    data['namedRoute'] = namedRoute;
    data['function'] = function;
    data['fullsize'] = fullsize;
    data['enabled'] = enabled;
    return data;
  }
}
