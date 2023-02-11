// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twr/models/question_bank.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SurveyQuestion extends StatefulWidget {
  const SurveyQuestion({Key? key}) : super(key: key);

  @override
  _SurveyQuestionState createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends State<SurveyQuestion> {
  QuestionBank questionBank = QuestionBank();
  String groupValue = "";
  List<String> allGroupVal = [];
  String? id;

  TextEditingController inputAnswer = TextEditingController();

  late final db = FirebaseFirestore.instance;

  var size, height, width;

  late final docData = {
    "question01": allGroupVal[0],
    "question02": allGroupVal[1],
    "question03": allGroupVal[2],
    "question04": allGroupVal[3],
    "question05": allGroupVal[4],
    "question06": allGroupVal[5],
    "question07": allGroupVal[6],
    "question08": allGroupVal[7],
    "question09": allGroupVal[8],
    "question10": allGroupVal[9],
    "question11": allGroupVal[10],
  };

  void userAnswer(userPickedAns) {
    bool pickLast = questionBank.finishedQuestion();

    setState(() {
      if (pickLast == true) {
        allGroupVal.add(groupValue);
        db
            .collection("surveyanswers")
            .doc(id)
            .set(docData)
            .onError((e, _) => print("Error writing document: $e"));

        Alert(
          context: context,
          type: AlertType.success,
          title: "Great!",
          desc: "Thank you for participating in our survey",
          closeFunction: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
          buttons: [
            DialogButton(
              color: Color(0xFF7F53AC),
              child: Text(
                "CANCEL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
              width: 180,
            )
          ],
        ).show();
      } else {
        questionBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double barPercent = (questionBank.newQuestionNumber() + 1) /
        questionBank.questionLen().toInt();

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC5A2FF),
              Color(0xFF95ACFF),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        '${questionBank.newQuestionNumber() + 1} of ${questionBank.questionLen().toInt()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Expanded(
                        flex: 2,
                        child: LinearPercentIndicator(
                          backgroundColor: Color(0XFF7F53AC),
                          width: 350,
                          lineHeight: 10,
                          alignment: MainAxisAlignment.center,
                          animation: true,
                          animationDuration: 1500,
                          progressColor: Colors.white,
                          animateFromLastPercent: true,
                          percent: barPercent,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              questionBank.getQuestion(),
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: questionBank.noAnwser()
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CustomContainer(
                                    widths:
                                        groupValue == questionBank.getAnwser(0)
                                            ? 3
                                            : 1,
                                    texts: questionBank.getAnwser(0),
                                    values: questionBank.getAnwser(0),
                                    selecteds:
                                        groupValue == questionBank.getAnwser(0),
                                    onChangeds: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                        print(groupValue);
                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomContainer(
                                    widths:
                                        groupValue == questionBank.getAnwser(1)
                                            ? 3
                                            : 1,
                                    texts: questionBank.getAnwser(1),
                                    values: questionBank.getAnwser(1),
                                    selecteds:
                                        groupValue == questionBank.getAnwser(1),
                                    onChangeds: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                        print(groupValue);
                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomContainer(
                                    widths:
                                        groupValue == questionBank.getAnwser(2)
                                            ? 3
                                            : 1,
                                    texts: questionBank.getAnwser(2),
                                    values: questionBank.getAnwser(2),
                                    selecteds:
                                        groupValue == questionBank.getAnwser(2),
                                    onChangeds: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                        print(groupValue);
                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomContainer(
                                    widths:
                                        groupValue == questionBank.getAnwser(3)
                                            ? 3
                                            : 1,
                                    texts: questionBank.getAnwser(3),
                                    values: questionBank.getAnwser(3),
                                    selecteds:
                                        groupValue == questionBank.getAnwser(3),
                                    onChangeds: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                        print(groupValue);
                                      });
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomContainer(
                                    widths:
                                        groupValue == questionBank.getAnwser(4)
                                            ? 3
                                            : 1,
                                    texts: questionBank.getAnwser(4),
                                    values: questionBank.getAnwser(4),
                                    selecteds:
                                        groupValue == questionBank.getAnwser(4),
                                    onChangeds: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                        print(groupValue);
                                      });
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (groupValue.isNotEmpty) {
                                        userAnswer(true);
                                        allGroupVal.add(groupValue);
                                        groupValue = "";
                                        print(allGroupVal);
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF7F53AC),
                                        fixedSize: Size(400, 70),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                ),
                              ],
                            )
                          : ListView(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                TextField(
                                  controller: inputAnswer,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 8,
                                  decoration: InputDecoration(
                                      hintText: 'Please tell us...',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF7F53AC),
                                              width: 2))),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (inputAnswer.text.isNotEmpty) {
                                        userAnswer(true);
                                        setState(() {
                                          allGroupVal.add(inputAnswer.text);
                                          inputAnswer.text = "";
                                          print(allGroupVal);
                                        });
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF7F53AC),
                                        fixedSize: Size(400, 70),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                ),
                              ],
                            ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  // const CustomContainer({Key? key}) : super(key: key);

  double widths;
  String texts;
  String values;
  bool selecteds;
  final void Function(String?) onChangeds;

  CustomContainer(
      {required this.widths,
      required this.texts,
      required this.values,
      required this.selecteds,
      required this.onChangeds});

  @override
  Widget build(BuildContext context) {
    // QuestionBank questionBank = QuestionBank();
    String groupValue = "";

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF7F53AC),
            width: widths,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: RadioListTile(
        title: Text(
          texts,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        value: values,
        groupValue: groupValue,
        selected: selecteds,
        controlAffinity: ListTileControlAffinity.trailing,
        onChanged: onChangeds,
        activeColor: Color(0xFF7F53AC),
        tileColor: Colors.green,
      ),
    );
  }
}
