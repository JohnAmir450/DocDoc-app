import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle font24Black700weight = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );


  static const TextStyle font32BlueBold=TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

   static const TextStyle font13GreyRegular=TextStyle(
    fontSize: 13,
    color: ColorsManager.mainGrey,
  );

   static const TextStyle font16WhiteSemiBold=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
