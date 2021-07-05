class HomeModel {
  int id;
  String? name;

  HomeModel({required this.id, this.name});

  static HomeModel fromJson(Map<String, dynamic> json) {
    return HomeModel(
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
