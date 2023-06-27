import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_repository.dart';
import 'package:honeybee/const/enums.dart';
import 'package:honeybee/routes/routes.dart';

class RecoveryPasswordController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode codeFocusNode = FocusNode();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmNewPasswordFocusNode = FocusNode();

  final RecoveryPasswordRepository _repository = RecoveryPasswordRepository();

  String _confirmPassword = '';

  int recoveryStage = 0;

  String buttonText = 'Enviar';

  ModelStates recoveryState = ModelStates.idle;

  bool showPassword = false;
  bool showConfirmPassword = false;

  switchButtonText() {
    if (recoveryStage == 1) {
      buttonText = 'Validar';
      notifyListeners();
    } else if (recoveryStage == 2) {
      buttonText = 'Recuperar';
      notifyListeners();
    }
  }

  changeShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  changeShowConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  String? validateEmail(String? v) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!v!.contains('@')) {
      return 'Email precisa ter @';
    } else if (!v.contains(emailRegex)) {
      return 'Formato de email incorreto';
    } else if (v.length <= 5) {
      return 'Email muito curto';
    }
    return null;
  }

  String? validateCode(String? v) {
    RegExp r = RegExp(r'^\d{6}$');
    if (v!.length < 6 || !v.contains(r)) {
      return 'Código inválido';
    }
    return null;
  }

  String? validatePassword(String? v) {
    if (v!.length <= 5) {
      return 'Senha deve conter ao menos 6 caracteres';
    }
    _confirmPassword = v;
    return null;
  }

  String? validateConfirmPassword(String? v) {
    if (v != _confirmPassword) {
      return 'Senhas não se conferem';
    }
    return null;
  }

  buttonActions(BuildContext context) async {
    if (recoveryStage == 2) {
      changePasswordProcess(context);
    } else if (recoveryStage == 1) {
      await verifyCodeProcess();
      recoveryStage = 2;
    } else {
      recoveryStage = 1;
      sendEmailProcess();
    }
  }

  sendEmailProcess() async {
    notifyListeners();
    await _repository.processSendEmail();
  }

  verifyCodeProcess() async {
    recoveryState = ModelStates.loading;
    notifyListeners();
    await _repository.processValidateCode();
    recoveryState = ModelStates.idle;
    notifyListeners();
  }

  changePasswordProcess(BuildContext context) async {
    recoveryState = ModelStates.loading;
    notifyListeners();
    await _repository.processChangePassword();
    Modular.to.pushNamedAndRemoveUntil(
      NamedRoutes.LOGIN,
      (p0) => false,
    );
    recoveryState = ModelStates.idle;
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Senha alterada com sucesso'),
      ),
    );
  }
}
