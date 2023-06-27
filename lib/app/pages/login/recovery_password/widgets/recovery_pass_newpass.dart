import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_controller.dart';
import 'package:honeybee/app/widgets/honeybee_textfield_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class RecoveryPassNewPassword extends StatefulWidget {
  const RecoveryPassNewPassword({super.key});

  @override
  State<RecoveryPassNewPassword> createState() =>
      _RecoveryPassNewPasswordState();
}

class _RecoveryPassNewPasswordState extends State<RecoveryPassNewPassword> {
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
            'Agora insira uma nova senha!',
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
              labelText: "Nova senha",
              controller: _controller.newPasswordController,
              focusNode: _controller.newPasswordFocusNode,
              obscureText: !_controller.showPassword,
              helperText: 'Deve conter ao menos 6 caracteres',
              suffixIcon: IconButton(
                onPressed: () => _controller.changeShowPassword(),
                icon: Icon(
                  _controller.showPassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              validator: _controller.validatePassword,
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
          const SizedBox(
            height: 20,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => HoneyBeeTextField(
              fillColor: AppColors.pageMainBackground,
              fieldHeight: 48,
              labelText: "Confirmar nova senha",
              controller: _controller.confirmNewPasswordController,
              focusNode: _controller.confirmNewPasswordFocusNode,
              suffixIcon: IconButton(
                onPressed: () => _controller.changeShowConfirmPassword(),
                icon: Icon(
                  _controller.showConfirmPassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              validator: _controller.validateConfirmPassword,
              obscureText: !_controller.showConfirmPassword,
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
