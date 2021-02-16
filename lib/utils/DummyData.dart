import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/models/Institution.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/models/Student.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/models/User.dart';

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
  static List<Submission> submission = List<Submission>.generate(10, (index) {
    return Submission(
        index,
        Questionnaire(
            id: index,
            assignmentId: index,
            institutionId: index,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
            interviewDate: DateTime.now().toString(),
            institution: "UNZA",
            department: "CS",
            mentor: "DMZ",
            startOfRotation: DateTime.now().toString()),
        Student(
            index,
            User(
                index,
                "Peter Kaboto",
                "peterkaboto9@gmail.com",
                "188036/91/1",
                "student",
                DateTime.now(),
                "password",
                institution,
                "yuefnwdm",
                DateTime.now(),
                DateTime.now()),
            "201737333$index",
            institution,
            DateTime.now(),
            DateTime.now()),
        Patient(initials: "PK", questionnaireId: index),
        index.isEven ? "Review" : "Approved",
        "",
        institution,
        DateTime.now(),
        DateTime.now());
  });
}
