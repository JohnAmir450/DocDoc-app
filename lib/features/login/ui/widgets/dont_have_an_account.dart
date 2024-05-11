import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theming/font_helper.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font14DarkBlueMedium),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap=(){
            context.pushReplacementNamed(Routes.signUpScreen);
          },
            text: 'Sign Up',
            style: TextStyles.font13BlueRegular
                .copyWith(fontWeight: FontWeightHelper.semiBold)),
            
      ]
      
      ),
    );
  }
}
