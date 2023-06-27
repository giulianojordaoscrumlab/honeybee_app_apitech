// ignore_for_file: prefer_collection_literals

class ModelRetornoLogin {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoLogin({this.success, this.body, this.error});

  ModelRetornoLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Body {
  String? message;
  Error? error;
  Data? data;
  String? token;

  Body({this.message, this.error, this.data, this.token});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Error {
  int? statusCode;

  Error({this.statusCode});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    return data;
  }
}

class Data {
  AccountData? accountData;
  String? sId;
  String? type;
  String? accountType;
  String? sAccountTypeComment;
  String? sComment;
  String? fullname;
  String? avatar;
  List<Roles>? roles;
  List<String>? permissions;

  Data(
      {this.accountData,
      this.sId,
      this.type,
      this.accountType,
      this.sAccountTypeComment,
      this.sComment,
      this.fullname,
      this.avatar,
      this.roles,
      this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    accountData = json['accountData'] != null
        ? AccountData.fromJson(json['accountData'])
        : null;
    sId = json['_id'];
    type = json['type'];
    accountType = json['accountType'];
    sAccountTypeComment = json['__accountTypeComment'];
    sComment = json['__comment'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    // if (json['permissions'] != null) {
    //   permissions = <String>[];
    //   json['permissions'].forEach((v) {
    //     permissions!.add(String.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (accountData != null) {
      data['accountData'] = accountData!.toJson();
    }
    data['_id'] = sId;
    data['type'] = type;
    data['accountType'] = accountType;
    data['__accountTypeComment'] = sAccountTypeComment;
    data['__comment'] = sComment;
    data['fullname'] = fullname;
    data['avatar'] = avatar;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    // if (permissions != null) {
    //   data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    // }
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
  bool? deleted;

  AccountData(
      {this.creation,
      this.lastLogon,
      this.active,
      this.userName,
      this.passwordFormat,
      this.password,
      this.passwordReset,
      this.canChangePassword,
      this.deleted});

  AccountData.fromJson(Map<String, dynamic> json) {
    creation =
        json['creation'] != null ? Creation.fromJson(json['creation']) : null;
    lastLogon = json['lastLogon'] != null
        ? LastLogon.fromJson(json['lastLogon'])
        : null;
    active = json['active'];
    userName = json['userName'];
    passwordFormat = json['passwordFormat'];
    password = json['password'];
    passwordReset = json['passwordReset'];
    canChangePassword = json['canChangePassword'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['deleted'] = deleted;
    return data;
  }
}

class Creation {
  String? date;
  String? time;
  String? timezone;
  String? platform;

  Creation({this.date, this.time, this.timezone, this.platform});

  Creation.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    timezone = json['timezone'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

  LastLogon({this.date, this.time, this.timezone});

  LastLogon.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['time'] = time;
    data['timezone'] = timezone;
    return data;
  }
}

class Roles {
  Role? role;
  String? sId;

  Roles({this.role, this.sId});

  Roles.fromJson(Map<String, dynamic> json) {
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}

class Role {
  String? userMainProfile;

  Role({this.userMainProfile});

  Role.fromJson(Map<String, dynamic> json) {
    userMainProfile = json['userMainProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userMainProfile'] = userMainProfile;
    return data;
  }
}
