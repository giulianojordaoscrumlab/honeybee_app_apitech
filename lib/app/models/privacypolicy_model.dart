class PrivacyPolicyModel {
  String? message;
  Error? error;
  Data? data;

  PrivacyPolicyModel({message, error, data});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = (json['error'] != null && json["error"].length > 0)
        ? Error.fromJson(json['error'])
        : null;

    data = (json['data'] != null) ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class Error {
  String? errorMessage;
  int? statusCode;
  String? errorStatus;

  Error({errorMessage, statusCode, errorStatus});

  Error.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    statusCode = json['statusCode'];
    errorStatus = json['errorStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;
    data['statusCode'] = statusCode;
    data['errorStatus'] = errorStatus;
    return data;
  }
}

class Data {
  String? sId;
  String? resource;
  String? kind;
  String? content;

  Data({sId, resource, kind, content});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    resource = json['resource'];
    kind = json['kind'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['resource'] = resource;
    data['kind'] = kind;
    data['content'] = content;
    return data;
  }
}
