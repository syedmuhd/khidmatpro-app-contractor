class Contractor {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  int? isFulltime;
  int? isCompany;
  String? ssm;
  String? address;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isOnboardingCompleted;
  int? currentOnboardingStep;
  int? source;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? token;

  Contractor(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.isFulltime,
      this.isCompany,
      this.ssm,
      this.address,
      this.countryId,
      this.stateId,
      this.cityId,
      this.isOnboardingCompleted,
      this.currentOnboardingStep,
      this.source,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.token});

  Contractor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    isFulltime = json['is_fulltime'];
    isCompany = json['is_company'];
    ssm = json['ssm'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    isOnboardingCompleted = json['is_onboarding_completed'];
    currentOnboardingStep = json['current_onboarding_step'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['is_fulltime'] = isFulltime;
    data['is_company'] = isCompany;
    data['ssm'] = ssm;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['is_onboarding_completed'] = isOnboardingCompleted;
    data['current_onboarding_step'] = currentOnboardingStep;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['token'] = token;

    return data;
  }

  Map<String, dynamic> toJsonWithoutNull() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['is_fulltime'] = isFulltime;
    data['is_company'] = isCompany;
    data['ssm'] = ssm;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['is_onboarding_completed'] = isOnboardingCompleted;
    data['current_onboarding_step'] = currentOnboardingStep;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['token'] = token;

    // Remove entries with null values
    data.removeWhere((key, value) => value == null);

    return data;
  }

  static List<Contractor> listFromJson(list) =>
      List<Contractor>.from(list.map((x) => Contractor.fromJson(x)));

  Contractor withoutToken() {
    return Contractor(
      id: id,
      name: name,
      phone: phone,
      email: email,
      password: password,
      isFulltime: isFulltime,
      isCompany: isCompany,
      ssm: ssm,
      address: address,
      countryId: countryId,
      stateId: stateId,
      cityId: cityId,
      isOnboardingCompleted: isOnboardingCompleted,
      currentOnboardingStep: currentOnboardingStep,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
