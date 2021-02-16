class Questionnaire {
  int id;
  int assignmentId;
  String institution;
  String department;
  String mentor;
  String interviewDate;
  String startOfRotation;
  int institutionId;
  String createdAt;
  String updatedAt;

  Questionnaire(
      {this.id,
      this.assignmentId,
      this.institution,
      this.department,
      this.mentor,
      this.interviewDate,
      this.startOfRotation,
      this.institutionId,
      this.createdAt,
      this.updatedAt});

  Questionnaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentId = json['assignment_id'];
    institution = json['institution'];
    department = json['department'];
    mentor = json['mentor'];
    interviewDate = json['interview_date'];
    startOfRotation = json['start_of_rotation'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assignment_id'] = this.assignmentId;
    data['institution'] = this.institution;
    data['department'] = this.department;
    data['mentor'] = this.mentor;
    data['interview_date'] = this.interviewDate;
    data['start_of_rotation'] = this.startOfRotation;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Questionnaire{id: $id, assignmentId: $assignmentId, institution: $institution, department: $department, mentor: $mentor, interviewDate: $interviewDate, startOfRotation: $startOfRotation, institutionId: $institutionId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}