import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styels.dart';
import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocLinter extends StatelessWidget {
  const LoginBlocLinter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      // listenWhen: (previous, current) =>
      //     current is Loading || current is Sucess || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ));
        }, success: (loginResponse) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        }, error: (error) {
          context.pop();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 32,
                    ),
                    content: Text(
                      error,
                      style: TextStyles.font15DarkBlueMedium,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(
                            'Got It',
                            style: TextStyles.font14BlueSemiBold,
                          ))
                    ],
                  ));
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
