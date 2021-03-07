class User {
  int id;
  String name;
  String email;
  String nRC;
  String userType;
  String emailVerifiedAt;
  String institutionId;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.nRC,
      this.userType,
      this.emailVerifiedAt,
      this.institutionId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nRC = json['NRC'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['NRC'] = this.nRC;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}