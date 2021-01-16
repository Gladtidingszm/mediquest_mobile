import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAnswerQuestion extends StatefulWidget {


  int _questionNumber;

  TextAnswerQuestion(this._questionNumber, this._question);

  String _question;
  String answer;

  @override
  _TextAnswerQuestionState createState() => _TextAnswerQuestionState();
}

class _TextAnswerQuestionState extends State<TextAnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.headline4;
    return  Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(

            child: Container
              (
              child:  Row(

                children: [
                  Text("${widget._questionNumber}.  ",style: GoogleFonts.oswald(textStyle: display1,fontSize:17,fontWeight: FontWeight.bold ),),
                    Expanded(
                      child: TextFormField(
                        maxLines: 3,
                        decoration: new InputDecoration(
                        labelText: widget._question,
                        labelStyle: GoogleFonts.oswald(textStyle: display1,fontSize:17,fontWeight: FontWeight.bold ),
                        fillColor: Colors.white,

                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "Email cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                        widget.answer=value;
                      },
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),


            ),
          ),
        ],
      ),
    );
  }
}
