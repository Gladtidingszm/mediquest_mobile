import 'package:mediquest_mobile/components/DateAnswerQuestion.dart';
import 'package:mediquest_mobile/components/MultipleCheckQuestion.dart';
import 'package:mediquest_mobile/components/NumberAnswerQuestionView.dart';
import 'package:mediquest_mobile/components/SingleCheckQuestion.dart';
import 'package:mediquest_mobile/components/TextAnswerQuestion.dart';
import 'package:mediquest_mobile/constants/QuestionTypes.dart' as constants;
import 'package:mediquest_mobile/models/Question.dart';

class QuestionGUIFetcher {
  static getQuestionGUI(Question question) {
    String dataType = question?.answerDatatype;
    bool isMultipleSelection =
        question?.isMultipleSelection == 0 ? false : true;
    bool isOpenText = question?.isOpenText == 0 ? false : true;
    if (dataType == constants.dateAnswerQuestion) {
      return DateAnswerQuestion(question);
    } else if (dataType == constants.floatAnswerQuestion ||
        dataType == constants.intAnswerQuestion) {
      return NumberAnswerQuestionView(question);
    } else if (isOpenText) {
      return TextAnswerQuestion(question);
    } else if (question.options.isNotEmpty) {
      if (isMultipleSelection) {
        return MultipleSelectQuestion(question);
      } else {
        return SingleCheckQuestion(question);
      }
    }
  }
}
