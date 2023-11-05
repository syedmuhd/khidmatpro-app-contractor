class AuthModel {
  int? id;
  String? name;

  AuthModel({
    this.id,
    this.name,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        name: json["name"],
      );

  static List<AuthModel> listFromJson(list) =>
      List<AuthModel>.from(list.map((x) => AuthModel.fromJson(x)));
}
