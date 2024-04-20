import 'package:flutter/material.dart';
import 'package:islamypages/provider.dart';
import 'package:islamypages/switchbuttondark.dart';
import 'package:islamypages/switchbuttonlang.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    var lang =AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal:20),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.themeMode,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: vm.isDark()? Colors.white:Colors.black,
                    fontSize: 25,
                  ),
                ),
                SwitchButtondark(
                  enabled:() {vm.changeTheme(ThemeMode.dark);},
                  disabled: (){vm.changeTheme(ThemeMode.light);},
                ),
              ]),
          SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.language,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: vm.isDark()? Colors.white:Colors.black,
                    fontSize: 25,
                  ),
                ),
                SwitchButtonLang(
                  enabled:() {vm.changeLang("ar");},
                  disabled: (){vm.changeLang("en");},
                ),
              ]),
        ],
      ),
    );
  }
}
