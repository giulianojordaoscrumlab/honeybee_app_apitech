import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_controller.dart';
import 'package:honeybee/app/widgets/honeybee_textfield_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class RecoveryPassCode extends StatefulWidget {
  const RecoveryPassCode({super.key});

  @override
  State<RecoveryPassCode> createState() => _RecoveryPassCodeState();
}

class _RecoveryPassCodeState extends State<RecoveryPassCode> {
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
            'Enviamos um código em seu email, confira e insira-o aqui!',
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
              labelText: "Código",
              controller: _controller.codeController,
              focusNode: _controller.codeFocusNode,
              validator: _controller.validateCode,
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
