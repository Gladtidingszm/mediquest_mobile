import 'Institution.dart';
import 'User.dart';

class Student {
  int id;
  String computerNumber;

  String createdAt;
  String updatedAt;
  User user;
  Institution institution;

  Student(
      {this.id,
      this.computerNumber,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.institution});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    computerNumber = json['computer_number'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    institution = json['institution'] != null
        ? new Institution.fromJson(json['institution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['computer_number'] = this.computerNumber;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.institution != null) {
      data['institution'] = this.institution.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Student{id: $id, computerNumber: $computerNumber, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, institution: $institution}';
  }
}