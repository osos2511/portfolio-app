class Images {
  num? id;
  String? image;
  num? projectId;
  String? createdAt;
  String? updatedAt;
  Images({
      this.id, 
      this.image, 
      this.projectId, 
      this.createdAt, 
      this.updatedAt,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['project_id'] = projectId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}