import 'package:json_annotation/json_annotation.dart';
import 'package:mediquest_mobile/models/Institution.dart';

part 'Question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question {
  int id;
  String questionText;
  String options;
  @JsonKey(name: "is_option_text")
  bool isOpenText;
  @JsonKey(name: "is_multiple_selection")
  bool isMultipleSelection;
  @JsonKey(name: "selection_limit")
  int selectionLimit;
  @JsonKey(name: "answer_data_type")
  String dataType;
  Institution institution;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Question(
      this.id,
      this.questionText,
      this.options,
      this.isOpenText,
      this.isMultipleSelection,
      this.selectionLimit,
      this.dataType,
      this.institution,
      this.createdAt,
      this.updatedAt);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
