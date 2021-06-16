import 'package:flutter/cupertino.dart';
import 'Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class QuizBrain{
  int _questionNumber = 0;
  int _rightAnswers = 0;
  List<Question> _questionBank = [
    Question('India is a superpower',false),
    Question('We have led ourselves to famine, plague, war',true),
    Question('people work hard',true),
    Question('Prince Harry is taller than Prince William',false),
    Question('Marrakesh is the capital of Morocco',false),
    Question('Buying a used car will help you minimize deprecation',true),
    Question('Blogs build credibility and authority',true),
    Question('If a type 1 diabetic stays on top of their diet, insulin is not needed',false),
    Question('Maintaining physical fitness requires major lifestyle changes',false),
    Question('Skipping sleep can cause weight gain',true),
  ];
  List<Icon> _scorekeeper = [];
  void nextQuesNumber(BuildContext context){
    if (_questionNumber < _questionBank.length-1){
      _questionNumber++;
    }else{
      Alert(
        content: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              checkMarksText(),
              SizedBox(
                width: 7.0,
              ),
              checkMarksIcon(),
            ],
          ),
        ),
        context: context,
        title: 'Alert!',
        desc: 'Reached End\nTotal score\n\t$_rightAnswers/${_questionBank.length}',
      ).show();
      emptyScorekeeper();
      _questionNumber=0;
      _rightAnswers=0;
    }
  }
  Text alertText(String str){
    return Text(
      str,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  Icon alertIcon({IconData icon,Color colors}){
    return Icon(
      icon,
      color: colors,
      size : 30.0,
    );
  }
  Text checkMarksText(){
    if ((_rightAnswers*100)/_questionBank.length>50.0){
      return alertText('Passed');
    }else {
      return alertText('Failed');
    }
  }
  Icon checkMarksIcon(){
    if ((_rightAnswers*100)/_questionBank.length>50.0){
      return alertIcon(icon:Icons.check_circle,colors: Colors.green );
    }else{
      return alertIcon(icon:Icons.cancel_rounded,colors: Colors.red );
    }
  }
  void addRight() {
    _rightAnswers++;
  }
  List<Icon> getScoreKeeper(){
    return _scorekeeper;
  }
  void addScoreKeeper(Icon icon){
    _scorekeeper.add(icon);
  }
  void emptyScorekeeper(){
    _scorekeeper.clear();
  }
  int quesNumber(){
    return _questionNumber;
  }
  String getQuestion(int questionNumber){
    return _questionBank[questionNumber].questionText;
  }
  bool getAnswer(int questionNumber){
    return _questionBank[questionNumber].questionAnswer;
  }
}