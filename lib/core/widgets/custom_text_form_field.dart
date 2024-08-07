import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.isObscureText = false,
      this.suffixIcon,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.controller,
      required this.validator,
      this.keyboardType});
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: ColorsManager.mainBlue,
      obscureText: isObscureText,
      keyboardType: keyboardType,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        fillColor: ColorsManager.moreLighterGrey,
        filled: true,
        hintStyle: hintStyle ??
            TextStyles.font14GreyRegular
                .copyWith(color: ColorsManager.lightGrey),
        hintText: hintText,
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder: enabledBorder ??
            customOutlineInputBorder(color: ColorsManager.lightGrey),
        focusedBorder: focusedBorder ??
            customOutlineInputBorder(color: ColorsManager.mainBlue),
        errorBorder: customOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: customOutlineInputBorder(color: Colors.red)
      ),
      
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.3),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
