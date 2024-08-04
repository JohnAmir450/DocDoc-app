import 'package:doctor_app/core/helpers/app_regex.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/widgets/custom_text_form_field.dart';
import 'package:doctor_app/features/login/ui/widgets/password_validation.dart';
import 'package:doctor_app/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscure = true;
  bool isPasswordConfirmationObscure = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
          ),
          verticalSpace(18),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().phoneController,
            keyboardType: TextInputType.phone,
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          verticalSpace(18),
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: context.read<SignUpCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid Email';
              }
            },
          ),
          verticalSpace(18),
          CustomTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            isObscureText: isPasswordObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscure = !isPasswordObscure;
                });
              },
              child: Icon(isPasswordObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          CustomTextFormField(
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            isObscureText: isPasswordConfirmationObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscure =
                      !isPasswordConfirmationObscure;
                });
              },
              child: Icon(isPasswordConfirmationObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_rounded),
            ),
            hintText: 'Password Confirmation',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength)
        ],
      ),
    );
  }@override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
