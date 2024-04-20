import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class tasbeh extends StatefulWidget {
  tasbeh({super.key});

  @override
  State<tasbeh> createState() => _tasbehState();
}

class _tasbehState extends State<tasbeh> {
  double degree=0;
  int countertesbeh=0;
  int index=0;
  List<String>listindex=["سبحان الله","الحمد الله","لا اله الا الله","الله اكبر"];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 327,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(child:
                        Image.asset("assets/head of seb7a.png",width: 73,
                          height: 105,),
                      bottom: 195,
                      top: 0,
                      left: 150,
                    ),
                    Positioned(child:
                    Transform.rotate(
                      angle: degree*pi/180,
                      child: InkWell(
                        child: Image.asset("assets/tasbehrotate.png",
                          width: 232,height: 234,),onTap: (){
                          sebhaOnTap();
                    },
                      ),
                    ),
                    top: 88,)
                  ],
                ),
              ),
              Text(lang!.tasbehNumber,style:
              TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Container(
              width: 69,
              height: 81,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text(
                countertesbeh.toString(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
              SizedBox(height: 10,),
              Container(
                width: 137,
                height: 51,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFFB7935F),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Text(listindex[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  sebhaOnTap() {
    degree += 90;
    countertesbeh++;
    setState(() {});
    if (countertesbeh == 34) {
      countertesbeh = 0;
      index++;
      setState(() {});
      if (index == 4) {
        index = 0;
      }
    }
  }
}