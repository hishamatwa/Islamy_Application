import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamypages/themedata.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider.dart';
import 'hadeescontent.dart';
class HadithPage extends StatefulWidget {
  HadithPage({super.key});
  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  List<String> allHadith=[];

  List<String> hadithNames=[];

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
   var lang =AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    if(hadithNames.isEmpty)hadithView();
    return Column(
      children: [
        Image.asset(
          "assets/hadith_page_pic.png",
          height: size.height * 0.2,
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor, width: 2),
                bottom: BorderSide(color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor, width: 2),
              )),
          child:
          Expanded(
            child: Text(
              lang.hadith,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: vm.isDark() ? Colors.white :Colors.black,
                  fontSize: 25,
                  fontFamily: "ELMessiri",
                  fontWeight: FontWeight.w600),
            ),
          ),

        ),
        Expanded(
          child: ListView.builder(
            itemCount: hadithNames.length,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                Navigator.pushNamed(context, HadithView.routeName,arguments: hadithParameters(hadith: allHadith[index], hadithName: hadithNames[index]));
              },
              child: Text(
                hadithNames[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: vm.isDark() ? Colors.white :Colors.black,
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),


      ],
    );

  }

  Future hadithView() async{
    String hadith= await rootBundle.loadString("assets/files/ahadeth.txt");
    allHadith = hadith.split("#");
    for(int i=0;i<allHadith.length;i++){
      List<String> singleName= allHadith[i].split("\n");
      hadithNames.add(singleName[1]);
      singleName=[""];
    }
    setState(() {
    });
  }
}
class hadithParameters{
  String hadith;
  String hadithName;
  hadithParameters({required this.hadith,required this.hadithName});
}
