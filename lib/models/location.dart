class Location {
  int? id;
  int? contractorId;
  double? coverageInKm;
  double? latitude;
  double? longitude;
  String? street;
  int? postcode;
  String? state;
  String? city;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
      this.contractorId,
      this.coverageInKm,
      this.latitude,
      this.longitude,
      this.street,
      this.postcode,
      this.state,
      this.city,
      this.createdAt,
      this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractorId = json['contractor_id'];
    coverageInKm = json['coverage_in_km'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    street = json['street'];
    postcode = json['postcode'];
    state = json['state'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contractor_id'] = contractorId;
    data['coverage_in_km'] = coverageInKm;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['street'] = street;
    data['postcode'] = postcode;
    data['state'] = state;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonWithoutNull() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contractor_id'] = contractorId;
    data['coverage_in_km'] = coverageInKm;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['street'] = street;
    data['postcode'] = postcode;
    data['state'] = state;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data.removeWhere((key, value) => value == null);

    return data;
  }
}
