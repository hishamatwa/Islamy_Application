import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamypages/themedata.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';
import 'hadees.dart';

class HadithView extends StatelessWidget {
  static const String routeName = "HadithView";

  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as hadithParameters;
    List<String> hadith = args.hadith.split("\n");
    hadith.remove(hadith[1]);
    return Container(
      decoration: BoxDecoration(
          image: vm.isDark()
              ? DecorationImage(
              image: AssetImage("assets/MainBg DM.png"),
              fit: BoxFit.fill)
              : DecorationImage(
              image: AssetImage("assets/backgroundpage.png"),
              fit: BoxFit.fill)),
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
                  top: 50, left: 25, right: 25, bottom: 60),
              decoration: BoxDecoration(
                  color: vm.isDark()
                      ? ThemeControl.primarydarkColor.withOpacity(0.8)
                      : Color(0xFFF8F8F8).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    args.hadithName,
                    style: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontFamily: ThemeControl.elmessiri,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                  Divider(
                    color: vm.isDark() ? Color(0xffFACC1D) : theme.primaryColor,
                    thickness: 2,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: hadith.length,
                        itemBuilder: (context, index) => Text(
                          hadith[index],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color:
                              vm.isDark() ? Colors.white : Colors.black,
                              fontSize: 20,
                              fontFamily: ThemeControl.elmessiri,
                              fontWeight: FontWeight.w400),
                        )),
                  )
                ],
              ))),
    );
  }
}
