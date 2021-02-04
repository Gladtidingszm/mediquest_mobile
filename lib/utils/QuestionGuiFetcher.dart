import 'package:mediquest_mobile/components/date_answer_question.dart';
import 'package:mediquest_mobile/components/multiple_check_question.dart';
import 'package:mediquest_mobile/components/single_check_question.dart';
import 'package:mediquest_mobile/components/text_answer_question.dart';
import 'package:mediquest_mobile/constants/QuestionNames.dart' as constants;
import 'package:mediquest_mobile/models/Question.dart';

class QuestionGUIFetcher {
  static getQuestionGUI(Question question) {
    String dataType = question?.dataType;
    bool isMultipleSelection = question?.isMultipleSelection;
    bool isOpenText = question?.isOpenText;
    if (dataType == constants.dateAnswerQuestion) {
      return DateAnswerQuestion(question);
    } else if (isOpenText) {
      return TextAnswerQuestion(question);
    } else if (question?.options?.isNotEmpty) {
      if (isMultipleSelection) {
        return MultipleSelectQuestion(question);
      } else {
        return SingleCheckQuestion(question);
      }
    }
  }
}
