import 'package:doctor_app/core/theming/font_helper.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountYet extends StatelessWidget {
  const AlreadyHaveAnAccountYet({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font14DarkBlueMedium),
        TextSpan(
            text: 'Sign Up',
            style: TextStyles.font13BlueRegular
                .copyWith(fontWeight: FontWeightHelper.semiBold)),
      ]),
    );
  }
}
