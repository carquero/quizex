import 'package:Quizex/questionbank/questions_comunicacion.dart';
import 'package:Quizex/questionbank/questions_entorno.dart';
import 'package:Quizex/questionbank/questions_fuentes.dart';
import 'package:Quizex/questionbank/questions_int_marketing.dart';
import 'package:Quizex/questionbank/questions_logistica.dart';
import 'package:Quizex/questionbank/questions_protocolo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Quizex/data/category.dart';
import 'package:Quizex/pages/choosemodes.dart';
import 'package:Quizex/palette/styles.dart';
import 'package:Quizex/questionbank/questions_ebusiness.dart';
import 'package:Quizex/questionbank/questions_economia.dart';
import 'package:Quizex/questionbank/questions_estrategia.dart';
import 'package:Quizex/questionbank/questions_market.dart';
import 'package:Quizex/questionbank/questions_marketing.dart';
import 'package:Quizex/questionbank/questions_sector.dart';
import 'package:Quizex/questionbank/questions_fiscalidad.dart';
import 'package:Quizex/questionbank/questions_finanzaslp.dart';
import 'package:Quizex/questionbank/questions_finanzascp.dart';
//import 'package:Quizex/questionbank/questions_escritura.dart';
import 'package:Quizex/questionbank/questions_analisis.dart';
import 'package:Quizex/questionbank/questions_estrategiaav.dart';
import 'package:Quizex/questionbank/questions_instrumentos.dart';
import 'package:Quizex/questionbank/questions_projectfinance.dart';
import 'package:Quizex/questionbank/questions_ventas.dart';

// todo: get the category from data into a listview builder... 3v listview builder.
class CategoryPage extends StatelessWidget {
  List fasei = [
    'PARCIAL DE CONTABILIDAD',
    'CONTABILIDAD',
    economia,
    estrategia,
    fuentes,
    marketresearch,
    marketing,
    protocolo,
  ];
  List faseii = [
    comunicacion,
    entorno,
    'ESCRITURA',
    'PARCIAL DE CONTABILIDAD',
    finanzascp,
    'PARCIAL DE LARGO',
    finanzaslp,
    fiscalidad,
    logistica,
    int_marketing,
    sector,
  ];
  List faseiii = [
    analisis,
    ebusiness,
    estrategiaav,
    instrumentos,
    projectfinance,
    ventas
  ];
  // List optativas = [
  //   '',
  //   '',
  //   '',
  //   '',
  //   '',
  // ];
  List<Tab> tabs = [
    Tab(child: Text("FASE I")),
    Tab(child: Text("FASE II")),
    Tab(child: Text("FASE III")),
  ];
  CategoryPage({Key? key}) : super(key: key);

  /// category item builder widget
  Widget categoryWidget(List phase, List ects, int index, int whichphase,
      {var context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (whichphase == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPage(
                        'FASE I',
                        phaseslongname[phase[index]],
                        ects[index],
                        fasei[index])));
          } else if (whichphase == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPage(
                        'FASE II',
                        phaseslongname[phase[index]],
                        ects[index],
                        faseii[index])));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPage(
                        'FASE III',
                        phaseslongname[phase[index]],
                        ects[index],
                        faseiii[index])));
          }
        },
        child: Container(
          height: 30.h,
          width: 70.w,
          color: const Color(0xffe31c19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Text(
                  phase[index],
                  style: bold16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80.w, bottom: 10.h),
                child: Text(
                  ects[index],
                  style: bold16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// creates list of phases
  Widget phasesBuilder(
      List phase, List ects, int whichpase, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 40.w, right: 40.w),
      child: SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: phase.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return categoryWidget(phase, ects, index, whichpase,
                  context: context);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          //title: Text("Quizex"),
          backgroundColor: const Color(0xffe31c19),
          //centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
        ),
        body: SizedBox(
          child: TabBarView(children: [
            SizedBox(
                height: 500.h,
                child: phasesBuilder(fase1, fase1Ects, 1, context)),
            SizedBox(
                height: 500.h,
                child: phasesBuilder(fase2, fase2Ects, 2, context)),
            SizedBox(
                height: 500.h,
                child: phasesBuilder(fase3, fase3Ects, 3, context)),
          ]),
        ),
      ),
    );
  }
}
//hasta aquí edit
// CategoryPage({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffe31c19),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 40.w, top: 20.h),
//               child: const Text(
//                 'FASE I',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//                 height: 500.h,
//                 child: phasesBuilder(fase1, fase1Ects, 1, context)),
//             Padding(
//               padding: EdgeInsets.only(left: 40.w, top: 20.h),
//               child: const Text(
//                 'FASE II',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//                 height: 620.h,
//                 child: phasesBuilder(fase2, fase2Ects, 2, context)),
//             Padding(
//               padding: EdgeInsets.only(left: 40.w, top: 20.h),
//               child: const Text(
//                 'FASE III',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//                 height: 400.h,
//                 child: phasesBuilder(fase3, fase3Ects, 3, context)),
//           ],
//         ),
//       ));
// }
