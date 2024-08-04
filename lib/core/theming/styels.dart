import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static  TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );


  static  TextStyle font32BlueBold=TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );
  static  TextStyle font13BlueRegular=TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBlue,
  );

  static  TextStyle font14DarkBlueMedium=TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );
    static const TextStyle font14BlueSemiBold=TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainBlue,
  );
    static const TextStyle font15DarkBlueMedium=TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );


    static const TextStyle font24BlueBold=TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );
  static const TextStyle font14GreyRegular=TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainGrey,
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
