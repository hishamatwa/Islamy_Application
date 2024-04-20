import 'package:flutter/material.dart';
import 'package:islamypages/provider.dart';
import 'package:provider/provider.dart';


class SwitchButtonLang extends StatefulWidget {
  final Function enabled;
  final Function disabled;
  const SwitchButtonLang({super.key,
    required this.enabled,
    required this.disabled

  });

  @override
  State<SwitchButtonLang> createState() => _SwitchButtonLangState();
}

class _SwitchButtonLangState extends State<SwitchButtonLang> {


  @override
  Widget build(BuildContext context) {
    var vm =Provider.of<SettingsProvider>(context);
    var size =MediaQuery.of(context).size;
    bool state = vm.lang=="ar"? true:false;
    return InkWell(
      onTap: (){
        state =!state;
        setState(() {});
        if(state==false) widget.disabled();
        if(state==true) widget.enabled();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: size.width*0.14,
        height: size.height*0.04,
        alignment: (state==false)? Alignment.centerLeft : Alignment.centerRight,
        decoration: BoxDecoration(
            color: vm.isDark()?  Colors.black:Colors.white ,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: vm.isDark()? Colors.white : Colors.black,
              width: 2,
            )

        ),
        child: (state==false)? Text("En",textAlign: TextAlign.center,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: vm.isDark()?  Colors.white:Colors.black ,),): Text("Ar",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: vm.isDark()?  Colors.white:Colors.black ,),),
      ),
    );
  }
}
