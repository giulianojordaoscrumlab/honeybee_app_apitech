// ignore_for_file: prefer_collection_literals

class ModelRetornoLogout {
  String? message;
  Error? error;
  String? data;

  ModelRetornoLogout({this.message, this.error, this.data});

  ModelRetornoLogout.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

  Error({this.errorMessage, this.statusCode, this.errorStatus});

  Error.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    statusCode = json['statusCode'];
    errorStatus = json['errorStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['errorMessage'] = errorMessage;
    data['statusCode'] = statusCode;
    data['errorStatus'] = errorStatus;
    return data;
  }
}
