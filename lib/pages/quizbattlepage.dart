import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Quizex/pages/resultpage.dart';
import 'package:Quizex/palette/dialogbox.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// here we will play the quiz game, check if its which mode
class QuizBattle extends StatefulWidget {
  List questionbank;
  bool isexammode;

  QuizBattle(this.questionbank, {Key? key, this.isexammode = false})
      : super(key: key);

  @override
  _QuizBattleState createState() => _QuizBattleState();
}

class _QuizBattleState extends State<QuizBattle> {
  // exam mode have 30 questions.
  Set exammodeQuestions = {};
  List<int> rightAnswers = [];
  Map<int, int> wronganswerslist = {};
  int tileclicked = 6;
  // study mode
  int currentQsn = 1;
  Color answeColor = Colors.white;
  int selectedans = 20;
  int? correctAns;
  int? wronganswer;
  bool istapped = false;
  @override
  void initState() {
    selectedans = 20;
    correctAns = 20;
    wronganswer = 20;
    if (widget.isexammode) {
      getExamModeQuestions();
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalquestions = widget.isexammode
        ? exammodeQuestions.length
        : widget.questionbank.length;
    String question = widget.isexammode
        ? widget.questionbank[exammodeQuestions.elementAt(currentQsn - 1)].keys
            .elementAt(0)
        : widget.questionbank[currentQsn - 1].keys.elementAt(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fundamentnts),
        backgroundColor: const Color(0xffe31c19),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: 360.w,
                height: 600.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepProgressIndicator(
                      totalSteps: totalquestions,
                      currentStep: currentQsn,
                      selectedColor: Colors.black,
                      unselectedColor: Colors.grey.shade300,
                    ),
                    Divider(
                      height: 25.h,
                      color: Colors.white,
                    ),
                    // question number,
                    Text(
                      'Pregunta $currentQsn/$totalquestions'.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 25.sp),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    // question here
                    Text(
                      question,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    // asnwers
                    answerTile(question, 0),
                    answerTile(question, 1),
                    answerTile(question, 2),
                    answerTile(question, 3),
                  ],
                ),
              ),
              Positioned(
                bottom: 70.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.isexammode
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0))),
                                  backgroundColor: Colors.grey[600],
                                  onSurface: Colors.grey,
                                  padding: const EdgeInsets.all(20),
                                ),
                                onPressed: () {
                                  if (currentQsn > 1) {
                                    currentQsn -= 1;
                                    setState(() {});
                                  }
                                },
                                child: const Text("  ATRÁS  ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Bahnschrift",
                                      fontWeight: FontWeight.w700,
                                    ))),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                            backgroundColor: Colors.red[600],
                            onSurface: Colors.grey,
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: () {
                            if (currentQsn < totalquestions) {
                              setState(() {
                                if (widget.isexammode) {
                                  if (tileclicked != 6) {
                                    if (correctAns == tileclicked) {
                                      rightAnswers.add(exammodeQuestions
                                          .elementAt(currentQsn - 1));
                                    } else {
                                      wronganswerslist.addAll({
                                        exammodeQuestions.elementAt(
                                            currentQsn - 1): tileclicked
                                      });
                                    }

                                    tileclicked = 6;
                                    currentQsn += 1;
                                  } else {
                                    chooseAanswer(context);
                                  }
                                } else {
                                  tileclicked = 6;
                                  currentQsn += 1;
                                  correctAns = wronganswer = 20;
                                  istapped = false;
                                }
                              });
                            } else {
                              if (tileclicked != 6) {
                                if (correctAns == tileclicked) {
                                  rightAnswers.add(exammodeQuestions
                                      .elementAt(currentQsn - 1));
                                } else {
                                  wronganswerslist.addAll({
                                    exammodeQuestions.elementAt(currentQsn - 1):
                                        tileclicked
                                  });
                                }
                              } else if (widget.isexammode) {
                                chooseAanswer(context);
                              }
                              if (widget.isexammode && tileclicked != 6) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => ResultPage(
                                            widget.questionbank,
                                            rightAnswers,
                                            wronganswerslist)));
                              } else if (!widget.isexammode) {
                                dialogBox(context, () {
                                  setState(() {
                                    currentQsn = 1;
                                  });
                                });
                              }
                            }
                          },
                          child: const Text("SIGUIENTE",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Bahnschrift",
                                fontWeight: FontWeight.w700,
                              ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget answerTile(String question, int qsnNo) {
    return InkWell(
      onTap: () {
        if (!widget.isexammode) {
          istapped = true;
          wronganswer = qsnNo;
          setState(() {});
        } else {
          setState(() {
            tileclicked = qsnNo;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Builder(builder: (context) {
          correctAns =
              int.parse(widget.questionbank[currentQsn - 1]['answers']) - 1;
          if (qsnNo == correctAns && istapped) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60.h),
              child: Material(
                elevation: 3,
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  color: Colors.green,
                  duration: const Duration(milliseconds: 300),
                  width: 360.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      widget.questionbank[currentQsn - 1][question][qsnNo],
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (qsnNo == wronganswer && istapped) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60.h),
              child: Material(
                elevation: 3,
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  color: Colors.red[300],
                  duration: const Duration(milliseconds: 300),
                  width: 360.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      widget.questionbank[currentQsn - 1][question][qsnNo],
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60.h),
              child: Material(
                elevation: 3,
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  color:
                      tileclicked == qsnNo ? Colors.brown[100] : Colors.white,
                  duration: const Duration(milliseconds: 300),
                  width: 360.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      widget.isexammode
                          ? widget.questionbank[exammodeQuestions
                              .elementAt(currentQsn - 1)][question][qsnNo]
                          : widget.questionbank[currentQsn - 1][question]
                              [qsnNo],
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  void getExamModeQuestions() {
    var rnd = Random();
    while (exammodeQuestions.length != 30) {
      int randomIndex = rnd.nextInt(widget.questionbank.length);
      if (!exammodeQuestions.contains(randomIndex)) {
        exammodeQuestions.add(randomIndex);
      }
    }
  }
}
