import 'package:flutter/material.dart';
import 'package:projectone/widgets/app_text.dart';

import '../colors.dart';
  class AppButtons extends StatelessWidget {
  final Color color;
  String?text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
bool ? isIcon;

     AppButtons({Key?key,
  this.isIcon=false,
    this.text="hi",
    this.icon,
    required this.size,
    required this.color,
   required this.backgroundColor,
   required this.borderColor,}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height:size,
      decoration: BoxDecoration(
        border:Border.all(
          color:borderColor,
          width:1,
        ),
          borderRadius: BorderRadius.circular(20),
          color:  backgroundColor),
               child: isIcon==false?AppText(text: text!,color:color):Icon(icon,color:color),

    );
  }
}

















