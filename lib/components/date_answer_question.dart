import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DateAnswerQuestion extends StatefulWidget {

  int _questionNumber=1;
  String _question="Query";



  DateAnswerQuestion( this._questionNumber,this._question);

  @override
  _DateAnswerQuestionState createState() => _DateAnswerQuestionState();
}

class _DateAnswerQuestionState extends State<DateAnswerQuestion> {
  DateTime selectedDate = DateTime.now();
  String _answer;

  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.headline4;
    return  Container(
     margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(

              widget._questionNumber.toString()+". ${widget._question}",
              style: GoogleFonts.oswald(textStyle: display1,fontSize:17,fontWeight: FontWeight.bold ),

              ),
          SizedBox(
            height: 10.0,
          ),
          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),


              RaisedButton(
                onPressed: () => _selectDate(context), // Refer step 3
                child: Text(
                  'Select date',
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                color: Colors.white12,
              ),
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}