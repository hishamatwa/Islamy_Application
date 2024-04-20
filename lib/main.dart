import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamypages/provider.dart';
import 'package:islamypages/quransora.dart';
import 'package:islamypages/themedata.dart';
import 'package:provider/provider.dart';
import 'hadeescontent.dart';
import 'homescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      locale: Locale(vm.lang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashScreen.routeName,
      theme: ThemeControl.lightTheme,
      darkTheme: ThemeControl.darkTheme,
      themeMode: vm.themeMode,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranView.routeName: (context) => QuranView(),
        HadithView.routeName: (context) => const HadithView(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  static String routeName = "/";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: vm.isDark()? AssetImage("assets/image/SplashBg DM.png"):AssetImage("assets/SplashBg.png"),
            fit: BoxFit.fill,
          )),
    );
  }
}
