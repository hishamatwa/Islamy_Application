import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamypages/quranpage.dart';
import 'package:islamypages/themedata.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class QuranView extends StatefulWidget {
  static String routeName = "QuranView";

  QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    var args =ModalRoute.of(context)!.settings.arguments as SuraDetails;
    var size = MediaQuery.of(context).size;
    var theme =Theme.of(context);

    if (suraDetails.isEmpty) loadData((args.suraNum.toString()));
    return Container(
      decoration:  BoxDecoration(
          image: vm.isDark()? DecorationImage(
              image: AssetImage("assets/MainBg DM.png"), fit: BoxFit.fill): DecorationImage(
              image: AssetImage("assets/backgroundpage.png"), fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "اسلامي",
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(40),
            width: size.width,
            height: size.height,

            margin: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
                bottom: 60
            ),
            decoration: BoxDecoration(
                color:  vm.isDark() ? ThemeControl.primarydarkColor.withOpacity(0.8):const Color(0xFFF8F8F8).withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              children: [
                if(suraDetails.isEmpty)
                  Center(
                    child: CircularProgressIndicator(color: vm.isDark()? Color(0xFFF8F8F8):theme.primaryColor,),
                  ),
                if(suraDetails.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "سوره ${args.suraName}"
                        ,style: TextStyle(
                          color: vm.isDark() ? Colors.white :Colors.black,

                          fontFamily: ThemeControl.elmessiri,
                          fontSize: 25,
                          fontWeight: FontWeight.w400
                      ),
                      ),
                      SizedBox(width: 15,),
                      Icon(Icons.play_circle, color: vm.isDark()? Color(0xffFACC1D):theme.primaryColor ,)
                    ],
                  ),
                Divider(color:vm.isDark()? Color(0xffFACC1D):theme.primaryColor , ),
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        "${suraDetails[index]} (${index + 1})",
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: 20,
                            color: vm.isDark() ? Colors.white :Colors.black,
                            fontFamily: ThemeControl.elmessiri,
                            fontWeight: FontWeight.w400

                        ),

                      ),
                      itemCount: suraDetails.length,
                    ))
              ],
            ),
          )
      ),
    );
  }

  List<String> suraDetails =[];

  Future<void> loadData(String number) async{
    String sura= await rootBundle.loadString("assets/files/$number.txt");
    suraDetails = sura.split("\n");
    setState(() {});
  }
}
