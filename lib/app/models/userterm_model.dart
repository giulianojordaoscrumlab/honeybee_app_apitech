class UseTermsModel {
  String? message;
  Error? error;
  Data? data;

  UseTermsModel({message, error, data});

  UseTermsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = (json['error'] != null && json['error'].length > 0)
        ? Error.fromJson(json['error'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['message'] = message;
    if (error != null) {
      jsonData['error'] = error!.toJson();
    }
    if (data != null) {
      jsonData['data'] = data!.toJson();
    }
    return jsonData;
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
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['_id'] = sId;
    jsonData['resource'] = resource;
    jsonData['kind'] = kind;
    jsonData['content'] = content;
    return jsonData;
  }
}
