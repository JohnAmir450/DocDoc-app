import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:doctor_app/core/widgets/custom_text_button.dart';
import 'package:doctor_app/core/widgets/custom_text_form_field.dart';
import 'package:doctor_app/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:doctor_app/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(
                  8.h,
                ),
                const Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CustomTextFormField(hintText: 'Email'),
                      verticalSpace(18.h),
                      CustomTextFormField(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        isObscureText: isObscureText,
                      ),
                      verticalSpace(24),
                      const Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                      verticalSpace(40),
                      CustomTextButton(buttonText: 'Login',onPressed: (){},textStyle:TextStyles.font16WhiteSemiBold ,),
                      verticalSpace(16.h),
                      const TermsAndConditions(),
                      verticalSpace(60),
                      const AlreadyHaveAnAccountYet()

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
