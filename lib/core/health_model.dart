class HealthModel {

  var error;
  String? message;
  List<Data>? data;
  HealthModel({
      this.error, 
      this.message, 
      this.data,});

  HealthModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.itemName, 
      this.tips,});

  Data.fromJson(dynamic json) {
    itemName = json['item_name'];
    if (json['tips'] != null) {
      tips = [];
      json['tips'].forEach((v) {
        tips!.add(Tips.fromJson(v));
      });
    }
  }
  String? itemName;
  List<Tips>? tips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_name'] = itemName;
    if (tips != null) {
      map['tips'] = tips!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tips {
  Tips({
      this.id, 
      this.description, 
      this.image, 
      this.title, 
      this.postedOn, 
      this.readTime, 
      this.likeCount, 
      this.isLiked, 
      this.type,});

  Tips.fromJson(dynamic json) {
    id = json['_id'];
    description = json['description'];
    image = json['image'];
    title = json['title'];
    postedOn = json['posted_on'];
    readTime = json['read_time'];
    likeCount = json['like_count'];
    isLiked = json['is_liked'];
    type = json['type'];
  }
  String? id;
  String? description;
  String? image;
  String? title;
  String? postedOn;
  String? readTime;
  int? likeCount;
  int? isLiked;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['description'] = description;
    map['image'] = image;
    map['title'] = title;
    map['posted_on'] = postedOn;
    map['read_time'] = readTime;
    map['like_count'] = likeCount;
    map['is_liked'] = isLiked;
    map['type'] = type;
    return map;
  }

}