class PasswordValidator {
  PasswordValidator();

  static bool soft(String password, {int minSize = 6}) {
    return password.length >= minSize;
  }

  static bool half(String password, {int minSize = 6}) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{${minSize},}$');
    return regex.hasMatch(password);
  }

  static bool hard(String password, {int minSize = 6}) {
    final regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{${minSize},}$');
    return regex.hasMatch(password) && !password.contains('@');
  }
}
