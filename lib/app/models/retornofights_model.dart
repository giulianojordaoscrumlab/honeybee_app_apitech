// ignore_for_file: prefer_collection_literals

class ModelRetornoFights {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoFights({this.success, this.body, this.error});

  ModelRetornoFights.fromJson(Map<String, dynamic> json) {
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
  List<Fight>? fights;

  Body({this.message, this.error, this.fights});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      fights = <Fight>[];
      json['data'].forEach((v) {
        fights!.add(Fight.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (fights != null) {
      data['data'] = fights!.map((v) => v.toJson()).toList();
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

class Fight {
  Venue? venue;
  String? sId;
  String? eventDate;
  bool? active;
  bool? deleted;
  List<Images>? images;
  String? description;
  String? title;
  List<Matches>? matches;

  Fight(
      {this.venue,
      this.sId,
      this.eventDate,
      this.active,
      this.deleted,
      this.images,
      this.description,
      this.title,
      this.matches});

  Fight.fromJson(Map<String, dynamic> json) {
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    sId = json['_id'];
    eventDate = json['eventDate'];
    active = json['active'];
    deleted = json['deleted'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    description = json['description'];
    title = json['title'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    data['_id'] = sId;
    data['eventDate'] = eventDate;
    data['active'] = active;
    data['deleted'] = deleted;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['title'] = title;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Venue {
  String? name;
  String? location;

  Venue({this.name, this.location});

  Venue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['location'] = location;
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

class Matches {
  Referee? referee;
  Announcers? announcers;
  Winner? winner;
  bool? mainEvent;
  String? sId;
  bool? jfBelt;
  List<Fighters>? fighters;
  // List<Judges>? judges;
  String? startTime;
  String? endTime;
  String? status;
  int? numRounds;
  // List<Round>? rounds;
  String? totalDuration;
  List<Images>? images;
  List<VideosYTSL>? videosYTSL;

  Matches(
      {this.referee,
      this.announcers,
      this.winner,
      this.mainEvent,
      this.sId,
      this.jfBelt,
      this.fighters,
      // this.judges,
      this.startTime,
      this.endTime,
      this.status,
      this.numRounds,
      // this.rounds,
      this.totalDuration,
      this.images,
      this.videosYTSL});

  Matches.fromJson(Map<String, dynamic> json) {
    referee =
        json['referee'] != null ? Referee.fromJson(json['referee']) : null;
    announcers = json['announcers'] != null
        ? Announcers.fromJson(json['announcers'])
        : null;
    winner = json['winner'] != null ? Winner.fromJson(json['winner']) : null;
    mainEvent = json['mainEvent'];
    sId = json['_id'];
    jfBelt = json['jfBelt'];
    if (json['fighters'] != null) {
      fighters = <Fighters>[];
      json['fighters'].forEach((v) {
        fighters!.add(Fighters.fromJson(v));
      });
    }
    // if (json['judges'] != null) {
    //   judges = <Judges>[];
    //   json['judges'].forEach((v) {
    //     judges!.add(Judges.fromJson(v));
    //   });
    // }
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
    numRounds = json['numRounds'];
    // if (json['rounds'] != null) {
    //   rounds = <Null>[];
    //   json['rounds'].forEach((v) {
    //     rounds!.add(Null.fromJson(v));
    //   });
    // }
    totalDuration = json['totalDuration'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['videosYTSL'] != null) {
      videosYTSL = <VideosYTSL>[];
      json['videosYTSL'].forEach((v) {
        videosYTSL!.add(VideosYTSL.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (referee != null) {
      data['referee'] = referee!.toJson();
    }
    if (announcers != null) {
      data['announcers'] = announcers!.toJson();
    }
    if (winner != null) {
      data['winner'] = winner!.toJson();
    }
    data['mainEvent'] = mainEvent;
    data['_id'] = sId;
    data['jfBelt'] = jfBelt;
    if (fighters != null) {
      data['fighters'] = fighters!.map((v) => v.toJson()).toList();
    }
    // if (judges != null) {
    //   data['judges'] = judges!.map((v) => v.toJson()).toList();
    // }
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['status'] = status;
    data['numRounds'] = numRounds;
    // if (rounds != null) {
    //   data['rounds'] = rounds!.map((v) => v.toJson()).toList();
    // }
    data['totalDuration'] = totalDuration;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videosYTSL != null) {
      data['videosYTSL'] = videosYTSL!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Referee {
  SocialMedia? socialMedia;
  String? name;
  int? age;
  String? height;
  int? weight;

  Referee({this.socialMedia, this.name, this.age, this.height, this.weight});

  Referee.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? SocialMedia.fromJson(json['social_media'])
        : null;
    name = json['name'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.toJson();
    }
    data['name'] = name;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}

class SocialMedia {
  String? twitter;
  String? instagram;

  SocialMedia({this.twitter, this.instagram});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    twitter = json['twitter'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    return data;
  }
}

class Announcers {
  PlayByPlay? playByPlay;
  PlayByPlay? colorCommentator;
  List<Analysts>? analysts;

  Announcers({this.playByPlay, this.colorCommentator, this.analysts});

  Announcers.fromJson(Map<String, dynamic> json) {
    playByPlay = json['play_by_play'] != null
        ? PlayByPlay.fromJson(json['play_by_play'])
        : null;
    colorCommentator = json['color_commentator'] != null
        ? PlayByPlay.fromJson(json['color_commentator'])
        : null;
    if (json['analysts'] != null) {
      analysts = <Analysts>[];
      json['analysts'].forEach((v) {
        analysts!.add(Analysts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (playByPlay != null) {
      data['play_by_play'] = playByPlay!.toJson();
    }
    if (colorCommentator != null) {
      data['color_commentator'] = colorCommentator!.toJson();
    }
    if (analysts != null) {
      data['analysts'] = analysts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayByPlay {
  SocialMedia? socialMedia;
  String? name;

  PlayByPlay({this.socialMedia, this.name});

  PlayByPlay.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? SocialMedia.fromJson(json['social_media'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Analysts {
  SocialMedia? socialMedia;
  String? sId;
  String? name;

  Analysts({this.socialMedia, this.sId, this.name});

  Analysts.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? SocialMedia.fromJson(json['social_media'])
        : null;
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Winner {
  String? fighterId;
  String? name;
  String? method;

  Winner({this.fighterId, this.name, this.method});

  Winner.fromJson(Map<String, dynamic> json) {
    fighterId = json['fighter_id'];
    name = json['name'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fighter_id'] = fighterId;
    data['name'] = name;
    data['method'] = method;
    return data;
  }
}

class Fighters {
  Record? record;
  String? sId;
  String? fighterId;
  String? name;
  String? category;
  String? gender;
  int? age;
  int? height;
  int? weight;
  List<Images>? images;

  Fighters(
      {this.record,
      this.sId,
      this.fighterId,
      this.name,
      this.category,
      this.gender,
      this.age,
      this.height,
      this.weight,
      this.images});

  Fighters.fromJson(Map<String, dynamic> json) {
    record = json['record'] != null ? Record.fromJson(json['record']) : null;
    sId = json['_id'];
    fighterId = json['fighter_id'];
    name = json['name'];
    category = json['category'];
    gender = json['gender'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (record != null) {
      data['record'] = record!.toJson();
    }
    data['_id'] = sId;
    data['fighter_id'] = fighterId;
    data['name'] = name;
    data['category'] = category;
    data['gender'] = gender;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  int? wins;
  int? losses;
  int? draws;

  Record({this.wins, this.losses, this.draws});

  Record.fromJson(Map<String, dynamic> json) {
    wins = json['wins'];
    losses = json['losses'];
    draws = json['draws'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['wins'] = wins;
    data['losses'] = losses;
    data['draws'] = draws;
    return data;
  }
}

class ImagesEvent {
  String? sId;
  String? name;
  String? description;
  String? publishedAt;
  String? filename;
  String? uri;
  bool? active;
  bool? deleted;

  ImagesEvent(
      {this.sId,
      this.name,
      this.description,
      this.publishedAt,
      this.filename,
      this.uri,
      this.active,
      this.deleted});

  ImagesEvent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    publishedAt = json['publishedAt'];
    filename = json['filename'];
    uri = json['uri'];
    active = json['active'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['publishedAt'] = publishedAt;
    data['filename'] = filename;
    data['uri'] = uri;
    data['active'] = active;
    data['deleted'] = deleted;
    return data;
  }
}

class VideosYTSL {
  String? sId;
  String? name;
  String? description;
  String? publishedAt;
  String? originalThumb;
  String? idYoutube;
  String? urlYoutube;
  String? filename;
  int? initialPosition;
  bool? intervalLoop;
  bool? loop;
  bool? isYT;
  bool? isAsset;
  bool? autoplay;
  int? numDeslikes;
  int? numLikes;
  bool? active;
  bool? deleted;

  VideosYTSL(
      {this.sId,
      this.name,
      this.description,
      this.publishedAt,
      this.originalThumb,
      this.idYoutube,
      this.urlYoutube,
      this.filename,
      this.initialPosition,
      this.intervalLoop,
      this.loop,
      this.isYT,
      this.isAsset,
      this.autoplay,
      this.numDeslikes,
      this.numLikes,
      this.active,
      this.deleted});

  VideosYTSL.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    publishedAt = json['publishedAt'];
    originalThumb = json['originalThumb'];
    idYoutube = json['idYoutube'];
    urlYoutube = json['urlYoutube'];
    filename = json['filename'];
    initialPosition = json['initialPosition'];
    intervalLoop = json['intervalLoop'];
    loop = json['loop'];
    isYT = json['isYT'];
    isAsset = json['isAsset'];
    autoplay = json['autoplay'];
    numDeslikes = json['numDeslikes'];
    numLikes = json['numLikes'];
    active = json['active'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['publishedAt'] = publishedAt;
    data['originalThumb'] = originalThumb;
    data['idYoutube'] = idYoutube;
    data['urlYoutube'] = urlYoutube;
    data['filename'] = filename;
    data['initialPosition'] = initialPosition;
    data['intervalLoop'] = intervalLoop;
    data['loop'] = loop;
    data['isYT'] = isYT;
    data['isAsset'] = isAsset;
    data['autoplay'] = autoplay;
    data['numDeslikes'] = numDeslikes;
    data['numLikes'] = numLikes;
    data['active'] = active;
    data['deleted'] = deleted;
    return data;
  }
}
