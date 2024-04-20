import 'package:flutter/material.dart';
import 'package:islamypages/provider.dart';
import 'package:provider/provider.dart';


class SwitchButtondark extends StatefulWidget {
  final Function enabled;
  final Function disabled;
  const SwitchButtondark({super.key,
    required this.enabled,
    required this.disabled

  });

  @override
  State<SwitchButtondark> createState() => _SwitchButtondarkState();
}

class _SwitchButtondarkState extends State<SwitchButtondark> {


  @override
  Widget build(BuildContext context) {
    var vm =Provider.of<SettingsProvider>(context);
    var size =MediaQuery.of(context).size;
    bool state = vm.themeMode==ThemeMode.dark? true:false;
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
            color: (state==false)? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: (state==false)? Colors.black : Colors.white,
              width: 2,
            )

        ),
        child: (state==false)? const Icon((Icons.light_mode),size: 20,) : const Icon((Icons.dark_mode),size: 20,color: Colors.white,),
      ),
    );
  }
}
