// ignore_for_file: prefer_collection_literals

class ModelRetornoNews {
  bool? success;
  Body? body;
  Error? error;

  ModelRetornoNews({this.success, this.body, this.error});

  ModelRetornoNews.fromJson(Map<String, dynamic> json) {
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
  List<News>? news;

  Body({this.message, this.error, this.news});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    if (json['data'] != null) {
      news = <News>[];
      json['data'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (news != null) {
      data['data'] = news!.map((v) => v.toJson()).toList();
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

class News {
  Source? source;
  Content? content;
  PostedBy? postedBy;
  String? sId;
  String? headline;
  String? publishedAt;
  List<Images>? images;
  bool? active;
  bool? deleted;
  bool? newsFeed;
  bool? galery;
  bool? spotligth;
  bool? gallery;
  bool? spotlight;

  News(
      {this.source,
      this.content,
      this.postedBy,
      this.sId,
      this.headline,
      this.publishedAt,
      this.images,
      this.active,
      this.deleted,
      this.newsFeed,
      this.galery,
      this.spotligth,
      this.gallery,
      this.spotlight});

  News.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    postedBy =
        json['postedBy'] != null ? PostedBy.fromJson(json['postedBy']) : null;
    sId = json['_id'];
    headline = json['headline'];
    publishedAt = json['publishedAt'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    active = json['active'];
    deleted = json['deleted'];
    newsFeed = json['newsFeed'];
    galery = json['galery'];
    spotligth = json['spotligth'];
    gallery = json['gallery'];
    spotlight = json['spotlight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (postedBy != null) {
      data['postedBy'] = postedBy!.toJson();
    }
    data['_id'] = sId;
    data['headline'] = headline;
    data['publishedAt'] = publishedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['active'] = active;
    data['deleted'] = deleted;
    data['newsFeed'] = newsFeed;
    data['galery'] = galery;
    data['spotligth'] = spotligth;
    data['gallery'] = gallery;
    data['spotlight'] = spotlight;
    return data;
  }
}

class Source {
  String? name;
  String? website;
  String? author;
  String? sourceLink;

  Source({this.name, this.website, this.author, this.sourceLink});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    website = json['website'];
    author = json['author'];
    sourceLink = json['sourceLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['website'] = website;
    data['author'] = author;
    data['sourceLink'] = sourceLink;
    return data;
  }
}

class Content {
  String? text;
  String? html;
  String? jsonData;

  Content({this.text, this.html, this.jsonData});

  Content.fromJson(Map<String, dynamic> json) {
    jsonData = json['json'] ?? "";
    html = json['html'] ?? "";
    text = json['text'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['html'] = html;
    data['json'] = jsonData;
    return data;
  }
}

class PostedBy {
  String? userId;
  String? dateTime;

  PostedBy({this.userId, this.dateTime});

  PostedBy.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['dateTime'] = dateTime;
    return data;
  }
}

class Images {
  String? name;
  String? caption;
  String? credits;
  String? filename;
  String? sId;

  Images({this.name, this.caption, this.credits, this.filename, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caption = json['caption'];
    credits = json['credits'];
    filename = json['filename'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['caption'] = caption;
    data['credits'] = credits;
    data['filename'] = filename;
    data['_id'] = sId;
    return data;
  }
}
