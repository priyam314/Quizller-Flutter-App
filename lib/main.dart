import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body : SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon icon(bool v){
    bool value = (!quizBrain.getAnswer(quizBrain.quesNumber()) && !v) || (quizBrain.getAnswer(quizBrain.quesNumber()) && v);
    if (value){
      quizBrain.addRight();
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
  void set(bool v){
    setState(() {
      quizBrain.addScoreKeeper(
        icon(v),
      );
      quizBrain.nextQuesNumber(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestion(quizBrain.quesNumber()),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(85.0,20.0,85.0,20.0),
            child: RaisedButton(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              color : Colors.green,
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: (){
                set(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(85.0,20.0,85.0,20.0),
            child: RaisedButton(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              color : Colors.redAccent,
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: (){
                set(false);
              },
            ),
          ),
        ),
        Row(
          children: quizBrain.getScoreKeeper(),
        ),
      ],
    );
  }
}

