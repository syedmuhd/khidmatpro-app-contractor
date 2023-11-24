class RegistrationType {
  int? id;
  String? name;
  int? isEnabled;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  RegistrationType(
      {this.id,
      this.name,
      this.isEnabled,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  RegistrationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isEnabled = json['is_enabled'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_enabled'] = isEnabled;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
