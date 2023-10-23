import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors{
  //static Color primary =  const Color(0xFFEA6853);
  static Color white=const Color(0xFFFFFFFF);
  static Color textColor=const Color(0xFF2C0C0C);
  static Color formBgColor=const Color(0xFF818181);
  static Color buttonBorderColor=const Color(0xFF818181);

  static Color primary =  Color(0xffFF8198);
  static Color secondary =  Color(0xff2A4571);
  static Color headerColor =  Color(0xff6e7c87);
  static Color bg=Color(0xfffffafa);
  static Color offWhite=Color(0xffF2F2F2);
  static Color gold=Color(0xffe4aa69);
  static Color grey=Colors.grey;
  static Color greyWhite=Colors.grey.withOpacity(.2);
  static Color black=Color(0xff031626);
  static Color blackOpacity=Colors.black54;
  //static Color white=Colors.white;
  static Color notifyColor=Colors.black54;
  static Color convertColor(String color){
    int hex = int.parse(color.replaceFirst("#", "0xff"));
    return Color(hex);
  }



}