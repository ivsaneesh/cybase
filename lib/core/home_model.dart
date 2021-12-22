class HomeModel {
  HomeModel({
      this.message, 
      this.error, 
      this.data,});

  HomeModel.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  bool? error;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.popupBanner, 
      this.bookmarkCount, 
      this.banner, 
      this.articles, 
      this.healthVideos, 
      this.category, 
      this.liveUpdates,});

  Data.fromJson(dynamic json) {
    popupBanner = json['PopupBanner'] != null ? PopupBanner.fromJson(json['PopupBanner']) : null;
    bookmarkCount = json['bookmark_count'];
    if (json['banner'] != null) {
      banner = [];
      json['banner'].forEach((v) {
        banner?.add(Banner.fromJson(v));
      });
    }
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
    if (json['health_videos'] != null) {
      healthVideos = [];
      json['health_videos'].forEach((v) {
        healthVideos?.add(Health_videos.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(Category.fromJson(v));
      });
    }
    liveUpdates = json['live_updates'] != null ? LiveUpdates.fromJson(json['live_updates']) : null;
  }
  PopupBanner? popupBanner;
  int? bookmarkCount;
  List<Banner>? banner;
  List<Articles>? articles;
  List<Health_videos>? healthVideos;
  List<Category>? category;
  LiveUpdates? liveUpdates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (popupBanner != null) {
      map['PopupBanner'] = popupBanner?.toJson();
    }
    map['bookmark_count'] = bookmarkCount;
    if (banner != null) {
      map['banner'] = banner?.map((v) => v.toJson()).toList();
    }
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    if (healthVideos != null) {
      map['health_videos'] = healthVideos?.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      map['category'] = category?.map((v) => v.toJson()).toList();
    }
    if (liveUpdates != null) {
      map['live_updates'] = liveUpdates?.toJson();
    }
    return map;
  }

}

class LiveUpdates {
  LiveUpdates({
      this.id, 
      this.name,});

  LiveUpdates.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    return map;
  }

}

class Category {
  Category({
      this.image, 
      this.name,});

  Category.fromJson(dynamic json) {
    image = json['image'];
    name = json['name'];
  }
  String? image;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    return map;
  }

}

class Health_videos {
  Health_videos({
      this.id, 
      this.name, 
      this.maincategoryId, 
      this.maincategoryName, 
      this.videosList,});

  Health_videos.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    maincategoryId = json['maincategory_id'];
    maincategoryName = json['maincategory_name'];
    if (json['videos_list'] != null) {
      videosList = [];
      json['videos_list'].forEach((v) {
        videosList?.add(Videos_list.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? maincategoryId;
  String? maincategoryName;
  List<Videos_list>? videosList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['maincategory_id'] = maincategoryId;
    map['maincategory_name'] = maincategoryName;
    if (videosList != null) {
      map['videos_list'] = videosList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Videos_list {
  Videos_list({
      this.id, 
      this.video, 
      this.thumbnail, 
      this.duration, 
      this.createdAt, 
      this.likeCount, 
      this.isSaved, 
      this.isLiked, 
      this.type, 
      this.title,});

  Videos_list.fromJson(dynamic json) {
    id = json['_id'];
    video = json['video'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    likeCount = json['like_count'];
    isSaved = json['is_saved'];
    isLiked = json['is_liked'];
    type = json['type'];
    title = json['title'];
  }
  String? id;
  String? video;
  String? thumbnail;
  String? duration;
  String? createdAt;
  int? likeCount;
  int? isSaved;
  int? isLiked;
  String? type;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['video'] = video;
    map['thumbnail'] = thumbnail;
    map['duration'] = duration;
    map['createdAt'] = createdAt;
    map['like_count'] = likeCount;
    map['is_saved'] = isSaved;
    map['is_liked'] = isLiked;
    map['type'] = type;
    map['title'] = title;
    return map;
  }

}

class Articles {
  Articles({
      this.id, 
      this.name, 
      this.maincategoryId, 
      this.maincategoryName, 
      this.articleList,});

  Articles.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    maincategoryId = json['maincategory_id'];
    maincategoryName = json['maincategory_name'];
    if (json['article_list'] != null) {
      articleList = [];
      json['article_list'].forEach((v) {
        articleList?.add(Article_list.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? maincategoryId;
  String? maincategoryName;
  List<Article_list>? articleList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['maincategory_id'] = maincategoryId;
    map['maincategory_name'] = maincategoryName;
    if (articleList != null) {
      map['article_list'] = articleList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Article_list {
  Article_list({
      this.id, 
      this.readTime, 
      this.image, 
      this.createdAt, 
      this.likeCount, 
      this.isSaved, 
      this.isLiked, 
      this.title, 
      this.type,});

  Article_list.fromJson(dynamic json) {
    id = json['_id'];
    readTime = json['readTime'];
    image = json['image'];
    createdAt = json['createdAt'];
    likeCount = json['like_count'];
    isSaved = json['is_saved'];
    isLiked = json['is_liked'];
    title = json['title'];
    type = json['type'];
  }
  String? id;
  String? readTime;
  String? image;
  String? createdAt;
  int? likeCount;
  int? isSaved;
  int? isLiked;
  String? title;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['readTime'] = readTime;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['like_count'] = likeCount;
    map['is_saved'] = isSaved;
    map['is_liked'] = isLiked;
    map['title'] = title;
    map['type'] = type;
    return map;
  }

}

class Banner {
  Banner({
      this.id, 
      this.redirectType, 
      this.image,});

  Banner.fromJson(dynamic json) {
    id = json['_id'];
    redirectType = json['redirect_type'];
    image = json['image'];
  }
  String? id;
  String? redirectType;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['redirect_type'] = redirectType;
    map['image'] = image;
    return map;
  }

}

class PopupBanner {
  PopupBanner({
      this.img, 
      this.status,});

  PopupBanner.fromJson(dynamic json) {
    img = json['img'];
    status = json['status'];
  }
  String? img;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = img;
    map['status'] = status;
    return map;
  }

}