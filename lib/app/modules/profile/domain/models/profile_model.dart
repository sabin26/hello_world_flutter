class ProfileModel {
  int id;
  String? name;

  ProfileModel({required this.id, this.name});

  static ProfileModel fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int,
      name: json['name'] == null ? null : json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
