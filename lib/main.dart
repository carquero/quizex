import 'package:flutter/material.dart';
import 'package:Quizex/pages/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.7, 850.9),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Quizapp',
              theme: ThemeData(
                fontFamily: "Bahnschrift",
                primarySwatch: Colors.blue,
              ),
              home: const StartPage(),
            ));
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xffe31c19),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fitWidth)),
        child: Padding(
          padding: EdgeInsets.all(60.h),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                "BECAS",
                style: TextStyle(
                    color: const Color(0xffe31c19),
                    fontSize: 50.sp,
                    fontFamily: "Bahnschrift",
                    fontWeight: FontWeight.w900),
              ),
              Image.asset("assets/logo.png", fit: BoxFit.scaleDown, scale: 0.1),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage()));
                  },
                  child: const Text("Start")),
              const Spacer(
                flex: 2,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
