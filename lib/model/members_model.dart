class Member {
  int id;
  String name;
  String gender;

  Member({required this.id, required this.name, required this.gender});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
    };
  }
}
