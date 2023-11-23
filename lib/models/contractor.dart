class Contractor {
  int? id;
  String? phoneNumber;
  String? email;
  String? updatedAt;
  String? createdAt;
  String? token;

  Contractor(
      {this.id,
      this.phoneNumber,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.token});

  Contractor.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['token'] = token;

    return data;
  }
}
