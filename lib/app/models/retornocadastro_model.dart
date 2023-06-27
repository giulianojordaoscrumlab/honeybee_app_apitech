class RetornoCadastroModel {
  Id? iId;
  String? type;
  String? accountType;
  String? sAccountTypeComment;
  String? sComment;
  String? fullname;
  String? avatar;
  AccountData? accountData;
  List<Roles>? roles;
  List? permissions;

  RetornoCadastroModel({iId, type, accountType, sAccountTypeComment, sComment, fullname, avatar, accountData, roles, permissions});

  RetornoCadastroModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    type = json['type'];
    accountType = json['accountType'];
    sAccountTypeComment = json['__accountTypeComment'];
    sComment = json['__comment'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    accountData = json['accountData'] != null ? AccountData.fromJson(json['accountData']) : null;
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['type'] = type;
    data['accountType'] = accountType;
    data['__accountTypeComment'] = sAccountTypeComment;
    data['__comment'] = sComment;
    data['fullname'] = fullname;
    data['avatar'] = avatar;
    if (accountData != null) {
      data['accountData'] = accountData!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}

class AccountData {
  Creation? creation;
  LastLogon? lastLogon;
  bool? active;
  String? userName;
  String? passwordFormat;
  String? password;
  bool? passwordReset;
  bool? canChangePassword;

  AccountData({creation, lastLogon, active, userName, passwordFormat, password, passwordReset, canChangePassword});

  AccountData.fromJson(Map<String, dynamic> json) {
    creation = json['creation'] != null ? Creation.fromJson(json['creation']) : null;
    lastLogon = json['lastLogon'] != null ? LastLogon.fromJson(json['lastLogon']) : null;
    active = json['active'];
    userName = json['userName'];
    passwordFormat = json['passwordFormat'];
    password = json['password'];
    passwordReset = json['passwordReset'];
    canChangePassword = json['canChangePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (creation != null) {
      data['creation'] = creation!.toJson();
    }
    if (lastLogon != null) {
      data['lastLogon'] = lastLogon!.toJson();
    }
    data['active'] = active;
    data['userName'] = userName;
    data['passwordFormat'] = passwordFormat;
    data['password'] = password;
    data['passwordReset'] = passwordReset;
    data['canChangePassword'] = canChangePassword;
    return data;
  }
}

class Creation {
  String? date;
  String? time;
  String? timezone;
  String? platform;

  Creation({date, time, timezone, platform});

  Creation.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    timezone = json['timezone'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['timezone'] = timezone;
    data['platform'] = platform;
    return data;
  }
}

class LastLogon {
  String? date;
  String? time;
  String? timezone;

  LastLogon({date, time, timezone});

  LastLogon.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['timezone'] = timezone;
    return data;
  }
}

class Roles {
  Role? role;

  Roles({role});

  Roles.fromJson(Map<String, dynamic> json) {
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class Role {
  String? userMainProfile;

  Role({userMainProfile});

  Role.fromJson(Map<String, dynamic> json) {
    userMainProfile = json['userMainProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userMainProfile'] = userMainProfile;
    return data;
  }
}
