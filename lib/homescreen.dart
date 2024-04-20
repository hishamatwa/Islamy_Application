import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamypages/provider.dart';
import 'package:islamypages/quranpage.dart';
import 'package:islamypages/radio%20screen.dart';
import 'package:islamypages/settings.dart';
import 'package:islamypages/tasbeh.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadees.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> view = [
    QuranPage(),
    HadithPage(),
    tasbeh(),
    radioScreen(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var lang =AppLocalizations.of(context)!;
    return Container(
      decoration:  BoxDecoration(
          image: vm.isDark()? DecorationImage(
              image: AssetImage("assets/MainBg DM.png"), fit: BoxFit.fill): DecorationImage(
              image: AssetImage("assets/backgroundpage.png"), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            lang.islami,
          ),
        ),
        body: view[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/quranicon.png"),
                ),
                label: lang.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/hadeesicon.png")),
                label: lang.hadith),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/tasbehicon.png")),
                label: lang.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/radioicon.png")),
                label: lang.radio),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,size: 35,),
                label: lang.settings),
          ],
        ),
      ),
    );
  }
}
