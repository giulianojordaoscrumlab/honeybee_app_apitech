// ignore_for_file: prefer_collection_literals

class ModelRetornoFightsFilter {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoFightsFilter({this.success, this.body, this.error});

  ModelRetornoFightsFilter.fromJson(Map<String, dynamic> json) {
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
  FilteredFight? fight;
  String? createdId;

  Body({this.message, this.error, this.fight, this.createdId});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    fight = json['data'] != null ? FilteredFight.fromJson(json['data']) : null;
    createdId = json['createdId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (fight != null) {
      data['data'] = fight!.toJson();
    }
    data['createdId'] = createdId;
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

class FilteredFight {
  Referee? referee;
  Announcers? announcers;
  String? title;
  String? description;
  Venue? venue;
  Winner? winner;
  String? sId;
  List<ImageFight>? images;
  List<Fighters>? fighters;
  // List<Judges>? judges;
  String? date;
  List<Rounds>? rounds;
  String? eventDate;
  String? startTime;
  String? endTime;
  int? numRounds;
  String? totalDuration;
  bool? active;
  bool? deleted;

  FilteredFight(
      {this.referee,
      this.announcers,
      this.venue,
      this.winner,
      this.sId,
      this.fighters,
      this.images,
      // this.judges,
      this.title,
      this.description,
      this.date,
      this.rounds,
      this.eventDate,
      this.startTime,
      this.endTime,
      this.numRounds,
      this.totalDuration,
      this.active,
      this.deleted});

  FilteredFight.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    referee =
        json['referee'] != null ? Referee.fromJson(json['referee']) : null;
    announcers = json['announcers'] != null
        ? Announcers.fromJson(json['announcers'])
        : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    winner = json['winner'] != null ? Winner.fromJson(json['winner']) : null;
    sId = json['_id'];
    if (json['fighters'] != null) {
      fighters = <Fighters>[];
      json['fighters'].forEach((v) {
        fighters!.add(Fighters.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <ImageFight>[];
      json['images'].forEach((v) {
        images!.add(ImageFight.fromJson(v));
      });
    }
    // if (json['judges'] != null) {
    //   judges = <Judges>[];
    //   json['judges'].forEach((v) {
    //     judges!.add(Judges.fromJson(v));
    //   });
    // }
    date = json['date'];
    if (json['rounds'] != null) {
      rounds = <Rounds>[];
      json['rounds'].forEach((v) {
        rounds!.add(Rounds.fromJson(v));
      });
    }
    eventDate = json['eventDate'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    numRounds = json['numRounds'];
    totalDuration = json['totalDuration'];
    active = json['active'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (referee != null) {
      data['referee'] = referee!.toJson();
    }
    if (announcers != null) {
      data['announcers'] = announcers!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    if (winner != null) {
      data['winner'] = winner!.toJson();
    }

    data['title'] = title;
    data['description'] = description;
    data['_id'] = sId;
    if (fighters != null) {
      data['fighters'] = fighters!.map((v) => v.toJson()).toList();
    }
    // if (judges != null) {
    //   data['judges'] = judges!.map((v) => v.toJson()).toList();
    // }
    data['date'] = date;
    if (rounds != null) {
      data['rounds'] = rounds!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['eventDate'] = eventDate;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['numRounds'] = numRounds;
    data['totalDuration'] = totalDuration;
    data['active'] = active;
    data['deleted'] = deleted;
    return data;
  }
}

class ImageFight {
  String? name;
  String? filename;

  ImageFight({this.name, this.filename});

  ImageFight.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['filename'] = filename;
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
  int? age;
  String? height;
  int? weight;

  Fighters(
      {this.record,
      this.sId,
      this.fighterId,
      this.name,
      this.age,
      this.height,
      this.weight});

  Fighters.fromJson(Map<String, dynamic> json) {
    record = json['record'] != null ? Record.fromJson(json['record']) : null;
    sId = json['_id'];
    fighterId = json['fighter_id'];
    name = json['name'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (record != null) {
      data['record'] = record!.toJson();
    }
    data['_id'] = sId;
    data['fighter_id'] = fighterId;
    data['name'] = name;
    data['age'] = age;
    data['height'] = height;
    data['weight'] = weight;
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

class Rounds {
  String? sId;
  int? number;
  String? duration;
  String? winner;
  String? method;
  List<Moments>? moments;

  Rounds(
      {this.sId,
      this.number,
      this.duration,
      this.winner,
      this.method,
      this.moments});

  Rounds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    number = json['number'];
    duration = json['duration'];
    winner = json['winner'];
    method = json['method'];
    if (json['moments'] != null) {
      moments = <Moments>[];
      json['moments'].forEach((v) {
        moments!.add(Moments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['number'] = number;
    data['duration'] = duration;
    data['winner'] = winner;
    data['method'] = method;
    if (moments != null) {
      data['moments'] = moments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moments {
  String? sId;
  String? description;
  String? timestamp;

  Moments({this.sId, this.description, this.timestamp});

  Moments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['description'] = description;
    data['timestamp'] = timestamp;
    return data;
  }
}
