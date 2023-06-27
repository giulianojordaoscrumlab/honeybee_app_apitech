// ignore_for_file: prefer_collection_literals

class ModelDrawer {
  List<DrawerItems>? drawerItems;

  ModelDrawer({this.drawerItems});

  ModelDrawer.fromJson(Map<String, dynamic> json) {
    if (json['drawerItems'] != null) {
      drawerItems = <DrawerItems>[];
      json['drawerItems'].forEach((v) {
        drawerItems!.add(DrawerItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (drawerItems != null) {
      data['drawerItems'] = drawerItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrawerItems {
  String? type;
  bool? expandable;
  String? iconType;
  String? icon;
  String? label;
  bool? enabled;
  String? route;
  List<Childrens>? childrens;

  DrawerItems(
      {this.type,
      this.expandable,
      this.iconType,
      this.icon,
      this.label,
      this.enabled,
      this.route,
      this.childrens});

  DrawerItems.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    expandable = json['expandable'];
    iconType = json['iconType'];
    icon = json['icon'];
    label = json['label'];
    enabled = json['enabled'];
    route = json['route'];
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['expandable'] = expandable;
    data['iconType'] = iconType;
    data['icon'] = icon;
    data['label'] = label;
    data['enabled'] = enabled;
    data['route'] = route;
    if (childrens != null) {
      data['childrens'] = childrens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childrens {
  String? type;
  String? iconType;
  bool? expandable;
  String? icon;
  String? label;
  bool? enabled;
  String? route;

  Childrens(
      {this.type,
      this.iconType,
      this.expandable,
      this.icon,
      this.label,
      this.enabled,
      this.route});

  Childrens.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    iconType = json['iconType'];
    expandable = json['expandable'];
    icon = json['icon'];
    label = json['label'];
    enabled = json['enabled'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['iconType'] = iconType;
    data['expandable'] = expandable;
    data['icon'] = icon;
    data['label'] = label;
    data['enabled'] = enabled;
    data['route'] = route;
    return data;
  }
}
