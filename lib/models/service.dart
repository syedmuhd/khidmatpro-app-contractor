class Service {
  int? id;
  String? name;
  int? isEnabled;
  String? createdAt;
  String? updatedAt;

  Service({this.id, this.name, this.isEnabled, this.createdAt, this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isEnabled = json['is_enabled'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_enabled'] = isEnabled;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<Service> listFromJson(list) =>
      List<Service>.from(list.map((x) => Service.fromJson(x)));
}
