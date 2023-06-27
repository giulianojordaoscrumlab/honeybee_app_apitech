import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/login/login_controller.dart';
import 'package:honeybee/app/widgets/honeybee_formbuttom_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  var loginController = LoginController();

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
      backgroundColor: AppColors.pageMainBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1132),
            padding: EdgeInsets.all(screenWidth * 0.0463),
            width: screenWidth * 0.7737,
            height: screenHeight * 0.405,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary4.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            //! Logout Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.asset(
                  "assets/images/honeybee_logo.png",
                  width: screenWidth * 0.2176,
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'Já vai?',
                  style: HoneyBeeText.h3.copyWith(
                    color: AppColors.primary1,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                Center(
                  child: Text(
                    'Realmente deseja encerrar o Jungle Fight?',
                    style: HoneyBeeText.buttonLabel.copyWith(
                      fontSize: 18,
                      color: AppColors.primary4,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    AnimatedBuilder(
                      animation: loginController,
                      builder: (context, child) => Checkbox(
                        activeColor: AppColors.primary1,
                        checkColor: AppColors.primary4,
                        fillColor: const MaterialStatePropertyAll<Color>(
                            AppColors.primary1),
                        value: loginController.cleanCache,
                        onChanged: loginController.setCleanCache,
                      ),
                    ),
                    Text(
                      "Quero fazer login na volta",
                      style: HoneyBeeText.bodyLight.copyWith(
                        color: AppColors.primary4,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                HoneyBeeFormButton(
                  onPressed: () async => loginController.processLogout(
                      context, loginController.freePlan),
                  labelText: "Sim",
                  labelStyle:
                      HoneyBeeText.h3.copyWith(fontWeight: FontWeight.w500),
                  borderColor: AppColors.primary1,
                  width: screenWidth,
                  height: 53,
                  borderRadius: 6,
                ),
                const Spacer(
                  flex: 1,
                ),
                HoneyBeeFormButton(
                  onPressed: () async => Modular.to.pushNamed(NamedRoutes.HOME),
                  labelText: "Não",
                  labelStyle: HoneyBeeText.h3,
                  borderColor: AppColors.primary3,
                  backgroundColor: AppColors.primary3,
                  width: screenWidth,
                  height: 53,
                  borderRadius: 6,
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
