import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/login/login_controller.dart';
import 'package:honeybee/app/widgets/honeybee_textfield_widget.dart';
import 'package:honeybee/app/widgets/honeybee_formbuttom_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/enums.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller = LoginController();

  double screenWidth = 0.0;
  double screenHeight = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              "assets/images/honeybee_logo.png",
              width: screenWidth * 0.5,
            ),
            const SizedBox(
              height: 24,
            ),
            HoneyBeeTextField(
              fillColor: AppColors.primary1,
              fieldHeight: 90,
              enabled: true,
              labelText: "E-mail",
              obscureText: false,
              controller: controller.emailTextController,
              // hintText: "E-mail",
              focusNode: controller.emailFocusNode,
              backgroundColor: AppColors.pageMainBackground,
              focusBorderColor: AppColors.primary4,
              enabledBorderColor: AppColors.primary3,
              disabledBorderColor: AppColors.primary4,
              cursorColor: AppColors.primary3,
              hintColor: AppColors.formFieldGrayBorder,
              colorText: AppColors.blackTitle,
              labelColor: AppColors.secondary,
              errorBorderColor: AppColors.primary1,
              validatedBorderColor: AppColors.formFieldGreenBorder,
              borderRadius: 10.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => HoneyBeeTextField(
                fillColor: AppColors.primary1,
                fieldHeight: 48,
                labelText: "Senha",
                obscureText: !controller.showPass,
                controller: controller.senhaTextController,
                // hintText: "E-mail",
                focusNode: controller.senhaFocusNode,
                colorText: AppColors.blackTitle,

                backgroundColor: AppColors.pageMainBackground,
                focusBorderColor: AppColors.primary4,
                enabledBorderColor: AppColors.primary3,
                disabledBorderColor: AppColors.primary4,
                cursorColor: AppColors.primary3,
                hintColor: AppColors.formFieldGrayBorder,
                labelColor: AppColors.secondary,
                errorBorderColor: AppColors.primary1,
                validatedBorderColor: AppColors.formFieldGreenBorder,
                borderRadius: 10.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 24,
                alignment: Alignment.bottomRight,
                width: screenWidth,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () async => Modular.to.pushNamed(
                    NamedRoutes.FORGOTPASSWORD,
                  ),
                  child: Text(
                    "Esqueceu a senha?",
                    style: HoneyBeeText.h5.copyWith(
                      color: AppColors.secondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primary1,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.primary1,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: controller.showPass,
                    onChanged: controller.changeShowPass,
                    // activeColor: AppColors.primary1,
                    checkColor: AppColors.secondary,
                    fillColor:
                        const MaterialStatePropertyAll(AppColors.primary1),
                    tristate: false,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Mostrar senha!",
                    style: HoneyBeeText.body.copyWith(
                      color: AppColors.secondary,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            // rm -rm// ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => (controller.state ==
                      ModelStates.idle)
                  ? HoneyBeeFormButton(
                      onPressed: () async => controller.processLogin(context),
                      labelText: "Entrar",
                      labelStyle: HoneyBeeText.buttonLabel,
                      borderColor: AppColors.primary1,
                      width: screenWidth,
                      height: 53,
                      borderRadius: 6,
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary2,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: AppColors.primary3,
                        ),
                      ),
                      width: screenWidth,
                      height: 53,
                      margin: EdgeInsets.zero,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary1,
                        ),
                      ),
                    ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
