// ignore_for_file: prefer_collection_literals

class ModelRetornoVideos {
  String? name;
  String? description;
  String? originalThumb;
  String? idYoutube;
  String? urlYoutube;
  String? filename;
  int? filesize;
  String? publishedAt;
  String? uri;
  int? initialPosition;
  int? finalPosition;
  bool? autoplay;
  bool? loop;
  bool? showControls;
  bool? intervalLoop;
  bool? isAsset;
  bool? isYT;
  String? sId;
  int? numLikes;
  int? numDeslikes;
  int? viewCount;
  List<Comments>? comments;
  bool? active;
  bool? deleted;
  bool? spotlighted;

  ModelRetornoVideos(
      {this.name,
      this.description,
      this.originalThumb,
      this.idYoutube,
      this.urlYoutube,
      this.filename,
      this.filesize,
      this.publishedAt,
      this.uri,
      this.initialPosition,
      this.finalPosition,
      this.autoplay,
      this.loop,
      this.showControls,
      this.intervalLoop,
      this.isAsset,
      this.isYT,
      this.sId,
      this.numLikes,
      this.numDeslikes,
      this.viewCount,
      this.comments,
      this.active,
      this.deleted,
      this.spotlighted});

  ModelRetornoVideos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    originalThumb = json['originalThumb'];
    idYoutube = json['idYoutube'];
    urlYoutube = json['urlYoutube'];
    filename = json['filename'];
    filesize = json['filesize'];
    publishedAt = json['publishedAt'];
    uri = json['uri'];
    initialPosition = json['initialPosition'];
    finalPosition = json['finalPosition'];
    autoplay = json['autoplay'];
    loop = json['loop'];
    showControls = json['showControls'];
    intervalLoop = json['intervalLoop'];
    isAsset = json['isAsset'];
    isYT = json['isYT'];
    sId = json['sId'];
    numLikes = json['numLikes'];
    numDeslikes = json['numDeslikes'];
    viewCount = json['viewCount'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    active = json['active'];
    deleted = json['deleted'];
    spotlighted = json['spotlighted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['originalThumb'] = originalThumb;
    data['idYoutube'] = idYoutube;
    data['urlYoutube'] = urlYoutube;
    data['filename'] = filename;
    data['filesize'] = filesize;
    data['publishedAt'] = publishedAt;
    data['uri'] = uri;
    data['initialPosition'] = initialPosition;
    data['finalPosition'] = finalPosition;
    data['autoplay'] = autoplay;
    data['loop'] = loop;
    data['showControls'] = showControls;
    data['intervalLoop'] = intervalLoop;
    data['isAsset'] = isAsset;
    data['isYT'] = isYT;
    data['sId'] = sId;
    data['numLikes'] = numLikes;
    data['numDeslikes'] = numDeslikes;
    data['viewCount'] = viewCount;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['active'] = active;
    data['deleted'] = deleted;
    data['spotlighted'] = spotlighted;
    return data;
  }
}

class Comments {
  String? text;
  String? commentedAt;
  bool? active;
  bool? deleted;

  Comments({this.text, this.commentedAt, this.active, this.deleted});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    commentedAt = json['commentedAt'];
    active = json['active'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = text;
    data['commentedAt'] = commentedAt;
    data['active'] = active;
    data['deleted'] = deleted;
    return data;
  }
}
