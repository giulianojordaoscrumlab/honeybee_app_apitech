import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_controller.dart';
import 'package:honeybee/app/widgets/honeybee_textfield_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class RecoveryPassEmail extends StatefulWidget {
  const RecoveryPassEmail({super.key});

  @override
  State<RecoveryPassEmail> createState() => _RecoveryPassEmailState();
}

class _RecoveryPassEmailState extends State<RecoveryPassEmail> {
  final RecoveryPasswordController _controller = RecoveryPasswordController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recuperar senha',
            style: HoneyBeeText.h1,
          ),
          const Text(
            'Insira o email que deseja recuperar a senha',
            style: HoneyBeeText.h4,
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => HoneyBeeTextField(
              fillColor: AppColors.pageMainBackground,
              fieldHeight: 48,
              labelText: "Email",
              controller: _controller.emailController,
              focusNode: _controller.emailFocusNode,
              validator: _controller.validateEmail,
              backgroundColor: AppColors.pageMainBackground,
              focusBorderColor: AppColors.primary4,
              enabledBorderColor: AppColors.primary3,
              disabledBorderColor: AppColors.primary4,
              cursorColor: AppColors.primary3,
              hintColor: AppColors.formFieldGrayBorder,
              labelColor: AppColors.primary4,
              errorBorderColor: AppColors.primary1,
              validatedBorderColor: AppColors.formFieldGreenBorder,
              borderRadius: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
