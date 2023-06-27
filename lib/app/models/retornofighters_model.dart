// ignore_for_file: prefer_collection_literals

class ModelRetornoFighters {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoFighters({this.success, this.body, this.error});

  ModelRetornoFighters.fromJson(Map<String, dynamic> json) {
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
  List<FighterData>? fighters;

  Body({this.message, this.error, this.fighters});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      fighters = <FighterData>[];
      json['data'].forEach((v) {
        fighters!.add(FighterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (fighters != null) {
      data['data'] = fighters!.map((v) => v.toJson()).toList();
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

class FighterData {
  GoldenHolic? goldenHolic;
  Bio? bio;
  String? sId;
  String? name;
  String? category;
  String? gender;
  List<Videos>? videos;
  List<VideosYTSL>? videosYTSL;
  List<Images>? images;
  bool? canBeFollowed;
  int? hanking;
  bool? active;
  bool? deleted;
  bool? fighting;
  bool? hallOfFame;
  int? ranking;
  int? iV;

  FighterData(
      {this.goldenHolic,
      this.bio,
      this.sId,
      this.name,
      this.category,
      this.gender,
      this.videos,
      this.videosYTSL,
      this.images,
      this.canBeFollowed,
      this.hallOfFame,
      this.hanking,
      this.active,
      this.deleted,
      this.fighting,
      this.ranking,
      this.iV});

  FighterData.fromJson(Map<String, dynamic> json) {
    goldenHolic = json['goldenHolic'] != null
        ? GoldenHolic.fromJson(json['goldenHolic'])
        : null;
    bio = json['bio'] != null ? Bio.fromJson(json['bio']) : null;
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    gender = json['gender'];

    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }

    if (json['videosYTSL'] != null) {
      videosYTSL = <VideosYTSL>[];
      json['videosYTSL'].forEach((v) {
        videosYTSL!.add(VideosYTSL.fromJson(v));
      });
    }

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    canBeFollowed = json['canBeFollowed'];
    hanking = json['hanking'];
    active = json['active'];
    deleted = json['deleted'];
    fighting = json['fighting'];
    hallOfFame = json['hallOfFame'];
    ranking = json['ranking'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (goldenHolic != null) {
      data['goldenHolic'] = goldenHolic!.toJson();
    }
    if (bio != null) {
      data['bio'] = bio!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['category'] = category;
    data['gender'] = gender;

    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }

    if (videosYTSL != null) {
      data['videosYTSL'] = videosYTSL!.map((v) => v.toJson()).toList();
    }

    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }

    data['canBeFollowed'] = canBeFollowed;
    data['hanking'] = hanking;
    data['active'] = active;
    data['hallOfFame'] = hallOfFame;
    data['deleted'] = deleted;
    data['fighting'] = fighting;
    data['ranking'] = ranking;
    data['__v'] = iV;
    return data;
  }
}

class GoldenHolic {
  int? position;
  String? value;
  String? better;

  GoldenHolic({this.position, this.value, this.better});

  GoldenHolic.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    value = json['value'];
    better = json['better'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['position'] = position;
    data['value'] = value;
    data['better'] = better;
    return data;
  }
}

class Bio {
  MmaCartel? mmaCartel;
  String? description;
  String? birthdate;
  int? age;
  String? birthPlace;
  String? nationality;
  List<String>? otherNames;
  int? height;
  int? weight;
  List<String>? modalities;
  List<String>? organizations;
  List<String>? graduations;
  String? career;
  String? personalLife;
  List<SocialNetworks>? socialNetworks;
  // List<Null>? schedulees;
  bool? active;
  bool? fighting;
  // List<Null>? schedules;

  Bio({
    this.mmaCartel,
    this.description,
    this.birthdate,
    this.age,
    this.birthPlace,
    this.nationality,
    this.otherNames,
    this.height,
    this.weight,
    this.modalities,
    this.organizations,
    this.graduations,
    this.career,
    this.personalLife,
    this.socialNetworks,
    // this.schedulees,
    this.active,
    this.fighting,
    // this.schedules
  });

  Bio.fromJson(Map<String, dynamic> json) {
    mmaCartel = json['mmaCartel'] != null
        ? MmaCartel.fromJson(json['mmaCartel'])
        : null;
    description = json['description'];
    birthdate = json['birthdate'];
    age = json['age'];
    birthPlace = json['birthPlace'];
    nationality = json['nationality'];
    otherNames = json['otherNames'].cast<String>();
    height =
        json['height'] is String ? int.parse(json['height']) : json['height'];

    weight = json['weight'] is double
        ? int.parse(json['weight'].toString())
        : json['weight'];
    modalities = json['modalities'].cast<String>();
    organizations = json['organizations'].cast<String>();
    graduations = json['graduations'].cast<String>();
    career = json['career'];
    personalLife = json['personalLife'];
    if (json['socialNetworks'] != null) {
      socialNetworks = <SocialNetworks>[];
      json['socialNetworks'].forEach((v) {
        socialNetworks!.add(SocialNetworks.fromJson(v));
      });
    }
    // if (json['schedulees'] != null) {
    //   schedulees = <Null>[];
    //   json['schedulees'].forEach((v) {
    //     schedulees!.add(Null.fromJson(v));
    //   });
    // }
    active = json['active'];
    fighting = json['fighting'];
    // if (json['schedules'] != null) {
    //   schedules = <Null>[];
    //   json['schedules'].forEach((v) {
    //     schedules!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (mmaCartel != null) {
      data['mmaCartel'] = mmaCartel!.toJson();
    }
    data['description'] = description;
    data['birthdate'] = birthdate;
    data['age'] = age;
    data['birthPlace'] = birthPlace;
    data['nationality'] = nationality;
    data['otherNames'] = otherNames;
    data['height'] = height;
    data['weight'] = weight;
    data['modalities'] = modalities;
    data['organizations'] = organizations;
    data['graduations'] = graduations;
    data['career'] = career;
    data['personalLife'] = personalLife;
    if (socialNetworks != null) {
      data['socialNetworks'] = socialNetworks!.map((v) => v.toJson()).toList();
    }
    // if (schedulees != null) {
    //   data['schedulees'] = schedulees!.map((v) => v.toJson()).toList();
    // }
    data['active'] = active;
    data['fighting'] = fighting;
    // if (schedules != null) {
    //   data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MmaCartel {
  int? total;
  int? wins;
  int? knockouts;
  int? finalizations;
  int? looses;
  int? bydecision;

  MmaCartel(
      {this.total,
      this.wins,
      this.knockouts,
      this.finalizations,
      this.looses,
      this.bydecision});

  MmaCartel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    wins = json['wins'];
    knockouts = json['knockouts'];
    finalizations = json['finalizations'];
    looses = json['looses'];
    bydecision = json['bydecision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['wins'] = wins;
    data['knockouts'] = knockouts;
    data['finalizations'] = finalizations;
    data['looses'] = looses;
    data['bydecision'] = bydecision;
    return data;
  }
}

class SocialNetworks {
  String? sId;
  String? name;
  String? uri;

  SocialNetworks({this.sId, this.name, this.uri});

  SocialNetworks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['uri'] = uri;
    return data;
  }
}

class Videos {
  String? sId;
  String? name;
  String? uri;
  bool? showControls;
  bool? autoplay;

  Videos({this.sId, this.name, this.uri, this.showControls, this.autoplay});

  Videos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    uri = json['uri'];
    showControls = json['showControls'];
    autoplay = json['autoplay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['uri'] = uri;
    data['showControls'] = showControls;
    data['autoplay'] = autoplay;
    return data;
  }
}

class VideosYTSL {
  String? name;
  String? description;
  String? originalThumb;
  String? idYoutube;
  String? urlYoutube;
  String? filename;
  String? publishedAt;
  String? uri;
  String? sId;
  double? initialPosition;
  double? finalPosition;
  bool? showControls;
  bool? autoplay;
  bool? loop;
  bool? intervalLoop;
  bool? isAsset;
  bool? isYT;
  int? numLikes;
  int? numDeslikes;
  bool? active;
  bool? deleted;
  List<Comment>? comments;

  VideosYTSL({
    this.name,
    this.description,
    this.originalThumb,
    this.idYoutube,
    this.urlYoutube,
    this.filename,
    this.publishedAt,
    this.uri,
    this.sId,
    this.initialPosition,
    this.finalPosition,
    this.showControls,
    this.autoplay,
    this.loop,
    this.intervalLoop,
    this.isAsset,
    this.isYT,
    this.numLikes,
    this.numDeslikes,
    this.comments,
    this.active,
    this.deleted,
  });

  VideosYTSL.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    description = json["description"];
    originalThumb = json["originalThumb"];
    idYoutube = json["idYoutube"];
    urlYoutube = json["urlYoutube"];
    filename = json["filename"];
    publishedAt = json["publishedAt"];
    uri = json["uri"];
    sId = json["sId"];
    initialPosition = json["initialPosition"] is int
        ? double.parse(json["initialPosition"].toString())
        : json["initialPosition"] ?? 0.00;
    finalPosition = json["finalPosition"] ?? 2.00;
    showControls = json["showControls"] ?? true;
    autoplay = json["autoplay"] ?? true;
    loop = json["loop"] ?? false;
    intervalLoop = json["intervalLoop"] ?? false;
    isAsset = json["isAsset"] ?? false;
    isYT = json["isYT"] ?? false;
    numLikes = json["numLikes"] ?? 0;
    numDeslikes = json["numDesliked"] ?? 0;
    active = json["active"] ?? true;
    deleted = json["deleted"] ?? false;
    // comments = json["comments"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["description"] = description;
    data["originalThumb"] = originalThumb;
    data["idYoutube"] = idYoutube;
    data["urlYoutube"] = urlYoutube;
    data["filename"] = filename;
    data["publishedAt"] = publishedAt;
    data["uri"] = uri;
    data["sId"] = sId;
    data["initialPosition"] = initialPosition;
    data["finalPosition"] = finalPosition;
    data["showControls"] = showControls;
    data["autoplay"] = autoplay;
    data["loop"] = loop;
    data["intervalLoop"] = intervalLoop;
    data["isAsset"] = isAsset;
    data["isYT"] = isYT;
    data["active"] = active;
    data["deleted"] = deleted;
    return data;
  }
}

class Comment {
  String? sId;
  String? sIDAuthor;
  String? content;
  bool? active;
  bool? deleted;
  bool? canShow;
  bool? canRepply;
  List<String>? listRepplies;

  Comment({
    this.sId,
    this.sIDAuthor,
    this.content,
    this.active,
    this.deleted,
    this.canShow,
    this.canRepply,
    this.listRepplies,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    sId = json["sId"];
    sIDAuthor = json["sIDAuthor"];
    content = json["content"];
    active = json["active"];
    deleted = json["deleted"];
    canShow = json["canShow"];
    canRepply = json["canRepply"];
    listRepplies = json["listRepplies"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["sId"] = sId;
    data["sIDAuthor"] = sIDAuthor;
    data["content"] = content;
    data["active"] = active;
    data["deleted"] = deleted;
    data["canShow"] = canShow;
    data["canRepply"] = canRepply;
    data["listRepplies"] = listRepplies;
    return data;
  }
}

class Images {
  String? sId;
  String? name;
  String? filename;

  Images({this.sId, this.name, this.filename});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['filename'] = filename;
    return data;
  }
}
