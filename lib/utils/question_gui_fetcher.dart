import 'dart:html';

import 'package:mediquest_mobile/constants/question_names.dart' as constants;
class QuestionGUIFetcher{
  static getQuestionGUI(String questionType){
    switch(questionType){
      case constants.singleCheckAnswerQuestion:
        return Text("Single");
    }

  }
}

