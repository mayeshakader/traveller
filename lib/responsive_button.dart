import 'package:flutter/material.dart';
import 'package:projectone/widgets/app_text.dart';

import 'colors.dart';class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.width=120 ,this.isResponsive}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: isResponsive==true?double.maxFinite:width ,
          height:65,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:AppColors .accentColor ,
          ),
          child: Row(
            mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
              children:[
                isResponsive==true? Container(margin:const EdgeInsets.only(left:20),
                    child: AppText(text:"Book trip now",color:Colors.black87)):Container(),
                Image.asset("img/arrow.png"),
              ]
          )
      
      ),
    );
  }

}

