import 'package:doctor_app/core/helpers/app_regex.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/widgets/custom_text_form_field.dart';
import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordAndEmail extends StatefulWidget {
  const PasswordAndEmail({super.key});

  @override
  State<PasswordAndEmail> createState() => _PasswordAndEmailState();
}

class _PasswordAndEmailState extends State<PasswordAndEmail> {
  bool isObscureText = true;
  late TextEditingController passwordController;
   bool hasLowerCase = false;
   bool hasUpperCase = false;
   bool hasSpecialCharacters = false;
   bool hasNumber = false;
   bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
      passwordController.addListener(() {
      setState(() {
        hasLowerCase=AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase=AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters=AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber=AppRegex.hasNumber(passwordController.text);
        hasMinLength=AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid password';
              }
            },
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
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
