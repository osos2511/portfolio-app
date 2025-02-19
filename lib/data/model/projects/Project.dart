import 'Images.dart';
import 'Category.dart';

class Project {
  num? id;
  String? title;
  String? descriptions;
  String? url;
  String? tool;
  num? hidden;
  num? categoryId;
  String? createdAt;
  String? updatedAt;
  List<Images>? images;
  Category? category;

  Project({
    this.id,
    this.title,
    this.descriptions,
    this.url,
    this.tool,
    this.hidden,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.category,
  });

  Project.fromJson(dynamic json) {
    final data = json['data'] ?? json;
    id = data['id'];
    title = data['title'];
    descriptions = data['descriptions'];
    url = data['url'];
    tool = data['tool'];
    hidden = data['hidden'];
    categoryId = data['category_id'];
    createdAt = data['created_at'];
    updatedAt = data['updated_at'];
    if (data['images'] != null) {
      images = [];
      data['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    category = data['category'] != null ? Category.fromJson(data['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['descriptions'] = descriptions;
    map['url'] = url;
    map['tool'] = tool;
    map['hidden'] = hidden;
    map['category_id'] = categoryId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}
