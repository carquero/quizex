// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Quizex/pages/quizbattlepage.dart';

// ignore: must_be_immutable
class SubjectPage extends StatefulWidget {
  String fase;
  String fundamentnts;
  String ects;
  List question;

  SubjectPage(this.fase, this.fundamentnts, this.ects, this.question,
      {Key? key})
      : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fundamentnts),
        backgroundColor: const Color(0xffe31c19),
      ),
      body: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 160.h),
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.fase,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: -.5,
                                  fontFamily: "Bahnschrift",
                                  fontWeight: FontWeight.w700,
                                  //height: 0,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                            width: 400.w,
                            child: Text(
                              widget.fundamentnts,
                              style: TextStyle(
                                  fontFamily: "Bahnschrift",
                                  letterSpacing: -.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  height: 1,
                                  fontSize: 35.sp),
                            )),
                        Container(
                            child: Text(widget.ects,
                                style: TextStyle(
                                    fontFamily: "Bahnschrift",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16))),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        backgroundColor: Color(0xffe31c19),
                        onSurface: Colors.grey,
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizBattle(
                                      widget.question,
                                      isexammode: true,
                                    )));
                      },
                      child: Text("MODO EXAMEN",
                          style: TextStyle(
                            fontFamily: "Bahnschrift",
                            fontWeight: FontWeight.w700,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        backgroundColor: Colors.grey[600],
                        onSurface: Colors.grey,
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuizBattle(widget.question)));
                      },
                      child: Text("MODO ESTUDIO",
                          style: TextStyle(
                            fontFamily: "Bahnschrift",
                            fontWeight: FontWeight.w700,
                          ))),
                ),
              ],
            ),
            Container(
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
