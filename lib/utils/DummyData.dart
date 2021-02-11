import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/models/Institution.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';

class DummyData {
  //static Patient patient=Patient(1, DummyData.questionaire, "PK", DateTime.now(), 23, 'Male', DummyData.institution, DateTime.now(), DateTime.now());

  static Institution institution =
      Institution(DateTime.now(), DateTime.now(), "logo_url", "UNZA");
  static Assignment assignment;

  static Questionnaire questionaire = Questionnaire(
      assignmentId: 1,
      createdAt: "now",
      department: "dept",
      id: 1,
      institution: "inst",
      interviewDate: "date");
}
