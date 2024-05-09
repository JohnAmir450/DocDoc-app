import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacters, required this.hasNumber, required this.hasMinLength});

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        buildValidationRow('At least has 1 lowerCase letter',hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least has 1 UpperCase letter',hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least has 1 Special Characters',hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least has 1 Number',hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 Characters long',hasMinLength),
        
      ],
    );
  }
  
Widget buildValidationRow(String text, bool hasValidated) {
  return  Row(children: [
    const CircleAvatar(radius: 2.5,
    backgroundColor: Colors.red,
    ),
    horizontalSpace(6),
    Text(text,style:TextStyles.font13BlueRegular.copyWith(
      decoration: hasValidated?TextDecoration.lineThrough:null,
      decorationColor: Colors.green,
      decorationThickness: 2,
      color: hasValidated? ColorsManager.mainGrey:ColorsManager.darkBlue
    ) ,)
  ],);
}
}