class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        gender = json['gender'] as String?,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'status': status
      };
}
