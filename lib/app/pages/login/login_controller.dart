// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/models/retornologin_model.dart';
import 'package:honeybee/app/pages/login/login_repository.dart';
import 'package:honeybee/app/widgets/honeybee_formbuttom_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/enums.dart';
import 'package:honeybee/const/env.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';
import 'package:honeybee/shared/utils/email_validator.dart';
import 'package:honeybee/shared/utils/password_validator.dart';
import 'package:honeybee/shared/prefs.dart';

class LoginController extends ChangeNotifier {
  final repository = LoginRepository();

  bool freePlan = Env.planType == PlanType.free ? true : false;

  final emailFocusNode = FocusNode();
  final senhaFocusNode = FocusNode();

  final emailTextController = TextEditingController();
  final senhaTextController = TextEditingController();

  ModelRetornoLogin? retornoLogin;

  ModelStates state = ModelStates.idle;
  ModelStates pageState = ModelStates.idle;

  String? primeiroNome;

  bool showPass = false;

  doLoading() {
    pageState = ModelStates.loading;
    notifyListeners();
  }

  stopLoading() {
    pageState = ModelStates.idle;
    notifyListeners();
  }

  changeShowPass(value) {
    showPass = value;
    notifyListeners();
  }

  createAccount() {}

  bool cleanCache = false;

  setCleanCache(value) {
    cleanCache = value;
    notifyListeners();
  }

  bool acceptCancelation = false;

  setAcceptCancelation(value) {
    acceptCancelation = value;
    notifyListeners();
  }

  processLogout(BuildContext context, bool cleanCache) async {
    // await repository.getLogout();
    if (cleanCache) {
      await Prefs.clean();
    }
    if (Platform.isAndroid) {
      SystemNavigator.pop(
        animated: true,
      );
    } else {
      exit(0);
    }
  }

  processAccountCancel(BuildContext context) async {
    // await repository.getLogout();
    if (!acceptCancelation) {
      return;
    }

    var retornoCancel = await repository.doAccountCancelation();

    Modular.to.pushNamedAndRemoveUntil(NamedRoutes.LOGIN, (p0) => true);
  }

  processAccountSuspension(BuildContext context) async {
    // await repository.getLogout();
    if (!acceptCancelation) {
      return;
    }

    var retornoCancel = await repository.doAccountSuspension();

    Modular.to.pushNamedAndRemoveUntil(NamedRoutes.LOGIN, (p0) => true);
  }

  processLogin(BuildContext context) async {
    state = ModelStates.loading;
    notifyListeners();

    if (await validateLogin()) {
      // Pegar os dados do usuario

      //! Chamar o repo para o login...
      var usuario = emailTextController.value.text.trim();
      var senha = senhaTextController.value.text.trim();

      var plainPassword = senha.toString().trim();
      var plainEmail = usuario.toString().trim();

      await Prefs.setString('loggedUserPassword', plainPassword);
      await Prefs.setString('loggedUserEmail', plainEmail);

      retornoLogin = await repository.postLogin(usuario, senha);

      if (retornoLogin?.error?.statusCode == 200) {
        if (retornoLogin!.body!.token != null ||
            retornoLogin!.body!.token != "") {
          primeiroNome =
              retornoLogin?.body?.data?.fullname!.split(' ').first.toString();
          Prefs.setString("primeiroNome", primeiroNome ?? "Não informado");
          Prefs.setString("retornoLogin", jsonEncode(retornoLogin));
          await Prefs.setBool('acessed', true);
          state = ModelStates.idle;
          notifyListeners();
          Modular.to.pushNamed(NamedRoutes.HOME);
        }
      } else {
        AwesomeDialog(
          alignment: Alignment.center,
          bodyHeaderDistance: 25,
          buttonsBorderRadius: BorderRadius.circular(12),
          // customHeader: Container(
          //   decoration: BoxDecoration(
          //     color: AppColors.primary4,
          //     boxShadow: const [
          //       BoxShadow(
          //           offset: Offset(-3, 3),
          //           spreadRadius: -1,
          //           blurRadius: 8,
          //           color: AppColors.formFieldGrayBorder),
          //     ],
          //     borderRadius: BorderRadius.circular(100),
          //     // border: Border.all(
          //     //   color: AppColors.formFieldGrayBorder,
          //     //   width: 2,
          //     // ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child:
          //         SvgPicture.asset("assets/images/icon.svg"),
          //   ),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ops!",
                style: HoneyBeeText.h1.copyWith(
                  color: AppColors.primary4,
                ),
              ),
              Text(
                "Alguma informação não confere!",
                style: HoneyBeeText.h5.copyWith(
                  color: AppColors.primary5,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () => Modular.to.navigate(NamedRoutes.CREATEUSER),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Confira o e-mail e a senha!",
                        style: HoneyBeeText.h5.copyWith(
                          color: AppColors.primary4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
          transitionAnimationDuration: const Duration(milliseconds: 300),
          context: context,
          btnOkText: "OK",
          btnOk: HoneyBeeFormButton(
            labelText: "OK",
            backgroundColor: AppColors.primary1,
            labelColor: AppColors.primary4,
            borderRadius: 12,
            height: 45,
            onPressed: () => Modular.to.pop(),
          ),
          width: MediaQuery.of(context).size.width,
          btnOkColor: AppColors.primary1,
          btnOkOnPress: () => {},
          animType: AnimType.scale,
          barrierColor: AppColors.blackTitle.withOpacity(0.6),
          dialogBackgroundColor: AppColors.primary2,
          dialogType: DialogType.noHeader,
          isDense: false,
        ).show().whenComplete(() {
          state = ModelStates.idle;
          notifyListeners();
        });
      }
    }
  }

  bool? previousLogin = false;

  getPreviousLogin() async {
    previousLogin = await Prefs.getBool("previousLogin");
  }

  setPreviousLogin() async {
    await Prefs.setBool("previousLogin", true);
  }

  getLoggedUser() async {
    String loggedUser = await Prefs.getString('retornoLogin');

    if (loggedUser.isNotEmpty) {
      String userEmail = await Prefs.getString('loggedUserEmail');
      String userPassword = await Prefs.getString('loggedUserPassword');
      if (userEmail.contains('@') && userPassword.length > 5) {
        retornoLogin = await repository
            .postLogin(userEmail, userPassword)
            .whenComplete((() async => await repository.authDioInstance()));

        if (retornoLogin?.error?.statusCode == 200) {
          if (retornoLogin!.body!.token != null ||
              retornoLogin!.body!.token != "") {
            primeiroNome =
                retornoLogin?.body?.data?.fullname!.split(' ').first.toString();

            Prefs.setString("primeiroNome", primeiroNome ?? "Não informado");
            Prefs.setString("retornoLogin", jsonEncode(retornoLogin));
            state = ModelStates.idle;
            notifyListeners();
            Modular.to.navigate(NamedRoutes.HOME);
          }
        }
      } else {
        Prefs.setString("retornoLogin", "");
        Prefs.clean();
        notifyListeners();
        Modular.to.navigate(NamedRoutes.LOGIN);
      }
    }
  }

  Future<bool> validateLogin() async {
    bool validated = false;

    if (emailTextController.value.text.isNotEmpty) {
      validated = EmailValidator.simple(emailTextController.value.text);
    } else {
      validated = false;
    }

    if (senhaTextController.value.text.isNotEmpty) {
      validated = PasswordValidator.soft(senhaTextController.value.text);
    } else {
      validated = false;
    }

    return validated;
  }
}
