class Assignment {
  int id;
  String assignmentNumber;
  String description;
  String dateIssued;
  String dueDate;
  int courseId;
  int staffId;
  int institutionId;
  String createdAt;
  String updatedAt;

  Assignment(
      {this.id,
      this.assignmentNumber,
      this.description,
      this.dateIssued,
      this.dueDate,
      this.courseId,
      this.staffId,
      this.institutionId,
      this.createdAt,
      this.updatedAt});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentNumber = json['assignment_number'];
    description = json['description'];
    dateIssued = json['date_issued'];
    dueDate = json['due_date'];
    courseId = json['course_id'];
    staffId = json['staff_id'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assignment_number'] = this.assignmentNumber;
    data['description'] = this.description;
    data['date_issued'] = this.dateIssued;
    data['due_date'] = this.dueDate;
    data['course_id'] = this.courseId;
    data['staff_id'] = this.staffId;
    data['institution_id'] = this.institutionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Assignment{id: $id, assignmentNumber: $assignmentNumber, description: $description, dateIssued: $dateIssued, dueDate: $dueDate, courseId: $courseId, staffId: $staffId, institutionId: $institutionId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}