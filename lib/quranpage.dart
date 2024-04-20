import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamypages/quransora.dart';
import 'package:islamypages/themedata.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider.dart';
class QuranPage extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    var lang =AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(
          "assets/quran page.png",
          height: size.height * 0.2,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor, width: 2),
                bottom: BorderSide(color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor, width: 2),
              )),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    lang.suraNumber,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: vm.isDark() ? Colors.white :Colors.black,
                        fontSize: 25,
                        fontFamily: "ELMessiri",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                VerticalDivider(
                  color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor,
                  thickness: 3,
                ),
                Expanded(
                  child: Text(
                    lang.suraName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: vm.isDark() ? Colors.white :Colors.black,

                        fontSize: 25,
                        fontFamily: "ELMessiri",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suraNames.length,//114
            itemBuilder: (context, index) => IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      (index + 1).toString(),
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          color: vm.isDark() ? Colors.white :Colors.black,

                          fontSize: 25,
                          fontFamily: "ELMessiri",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  VerticalDivider(
                    color: vm.isDark()? Color(0xffFACC1D) : ThemeControl.primarylightColor,
                    thickness: 3,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, QuranView.routeName,arguments: SuraDetails(suraName: suraNames[index], suraNum: (index+1).toString()));
                      },
                      child: Text(
                        suraNames[index],
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            color: vm.isDark() ? Colors.white :Colors.black,

                            fontSize: 24,
                            fontFamily: "ELMessiri",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

}
class SuraDetails{
  String? suraName ;
  String? suraNum;
  SuraDetails({required this.suraName,required this.suraNum});
}
