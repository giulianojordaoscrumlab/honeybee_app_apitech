// ignore_for_file: prefer_collection_literals

class ModelRetornoApiaries {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoApiaries({this.success, this.body, this.error});

  ModelRetornoApiaries.fromJson(Map<String, dynamic> json) {
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
  List<Apiary>? apiary;

  Body({this.message, this.error, this.apiary});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      apiary = <Apiary>[];
      json['data'].forEach((v) {
        apiary!.add(Apiary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (apiary != null) {
      data['data'] = apiary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Error {
  int? statusCode;
  String? errorStatus;
  String? errorMessage;

  Error({this.statusCode, this.errorStatus, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    errorStatus = json['errorStatus'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['errorStatus'] = errorStatus;
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class Apiary {
  Contact? contact;
  Coordinates? coordinates;
  Address? address;
  String? sId;
  String? name;
  String? description;
  String? creationDate;
  bool? active;
  bool? deleted;
  String? image;
  String? video;

  Apiary(
      {this.contact,
      this.coordinates,
      this.address,
      this.sId,
      this.name,
      this.description,
      this.creationDate,
      this.active,
      this.deleted,
      this.image,
      this.video});

  Apiary.fromJson(Map<String, dynamic> json) {
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    creationDate = json['creation_date'];
    active = json['active'];
    deleted = json['deleted'];
    image = json['image'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['creation_date'] = creationDate;
    data['active'] = active;
    data['deleted'] = deleted;
    data['image'] = image;
    data['video'] = video;
    return data;
  }
}

class Contact {
  String? name;
  String? email;
  String? phone;

  Contact({this.name, this.email, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] is int
        ? double.parse(json['latitude'].toString())
        : json['latitude'];
    longitude = json['longitude'] is int
        ? double.parse(json['longitude'].toString())
        : json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Address {
  String? street;
  String? square;
  String? lot;
  String? neighborhood;
  String? city;
  String? complement;
  String? state;
  String? country;
  String? zipcode;

  Address(
      {this.street,
      this.square,
      this.lot,
      this.neighborhood,
      this.city,
      this.complement,
      this.state,
      this.country,
      this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    square = json['square'];
    lot = json['lot'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    complement = json['complement'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['street'] = street;
    data['square'] = square;
    data['lot'] = lot;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    data['complement'] = complement;
    data['state'] = state;
    data['country'] = country;
    data['zipcode'] = zipcode;
    return data;
  }
}
