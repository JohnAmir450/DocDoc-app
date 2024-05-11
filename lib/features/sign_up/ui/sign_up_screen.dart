import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:doctor_app/core/widgets/custom_text_button.dart';
import 'package:doctor_app/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:doctor_app/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:doctor_app/features/sign_up/ui/widgets/already_have_an_account.dart';
import 'package:doctor_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doctor_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                const Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignUpForm(),
                    verticalSpace(40),
                    CustomTextButton(
                        onPressed: (){
                          validateThenDoSignUp(context);
                        },
                        buttonText: 'Create Account',
                        textStyle: TextStyles.font16WhiteSemiBold),

                        verticalSpace(16),
                        const TermsAndConditions(),
                        verticalSpace(30),
                        const AlreadyHaveAccountText(),
                        const SignUpBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().emitSignUpState();
    }
  }
  
 
}


