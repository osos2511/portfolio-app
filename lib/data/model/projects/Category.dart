class Category {
  num? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Category({
      this.id, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}