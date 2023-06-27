import 'package:flutter/material.dart';

class AppColors {
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0XFFFFC62A),
    onPrimary: Color(0xFFF5E3B1),
    secondary: Color(0XFFF4CE66),
    onSecondary: Color(0xFFF5E3B1),
    error: Color(0XFFF2B8B5),
    onError: Color(0XFF601410),
    background: Color(0XFFFFF4D4),
    onBackground: Color(0XFFFFF4D4),
    surface: Color(0XFFFFF4D4),
    onSurface: Color(0XFFF4CE66),
    surfaceVariant: Color(0XFFF4CE66),
    surfaceTint: Color(0XFFF4CE66),
    outline: Color(0XFFFFC62A),
  );

  static const brightness = Brightness.light;

  static const redLive = Color(0XFFFFC62A);
  static const primary = Color(0XFFFFC62A);
  static const onPrimary = Color(0xFFF5E3B1);
  static const secondary = Color(0XFFF4CE66);
  static const onSecondary = Color(0XFFFFFFFF);
  static const error = Color(0XFFF2B8B5);
  static const onError = Color(0XFF601410);
  static const background = Color(0XFFFFF4D4);
  static const onBackground = Color(0XFFFFFFFF);
  static const surface = Color(0XFFFFF4D4);
  static const onSurface = Color(0XFFF4CE66);
  static const surfaceVariant = Color(0XFFF4CE66);
  static const surfaceTint = Color(0XFFF4CE66);
  static const outline = Color(0XFFFFC62A);

  //! PRIMARY COLORS
  static const primary1 = Color(0xFFFFC62A);
  static const primary2 = Color(0xFFF4CE66);
  static const primary3 = Color(0xFF333333);
  static const primary4 = Color(0xFFFFFFFF);
  static const primary5 = Color(0xFFF48787); //Disabled button overlay

  //! V2 Colors
  static const v2PureBlack = Color(0xFF000000);
  static const v2FrontWhite = Color(0xFFF4F4F4);
  static const v2MainBackground = Color(0xFF161618);
  static const v2GradientTop = Color(0xFF222327);
  static const v2GradientBase = Color(0xFF252525);
  static const v2BorderColor = Color(0xFF313131);
  static const v2PurePrimaryRed = Color(0xFFF40000);
  static const v2FadedWhite = Color(0x40F4F4F4);

  //* Linear Gradients
  static const bottonGradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.3799, 0.7602),
    colors: <Color>[
      Color(0xFF222327),
      Color(0xFF0A0A0A),
    ],
    tileMode: TileMode.clamp,
  );

  static const bottonGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.3799, 0.7602),
    colors: <Color>[
      Color(0xFF222327),
      Color(0xFF0A0A0A),
    ],
    tileMode: TileMode.mirror,
  );

  //! CUSTOM COLLORS
  static const pageMainBackground = Color(0xFF000000);
  static const transparent = Colors.transparent;
  static const buttonBlueColor = Color(0xFF2476B0);

  //! CARD COLORS
  static const cardChipGreen = Color(0xFF6DF46D);
  static const cardChipYellow = Color(0xFFF4F46D);
  static const cardChipRed = Color(0xFFF46D6D);
  static const starFilledColor = Color(0xFFF4C96D);

  //! BLACK TITLE
  static const blackTitle = Color(0xFF060606);
  static const whiteTitle = Color(0xFFF6F6F6);
  static const redTitle = Color(0xFFF60000);
  static const greenTitle = Color(0xFF00F600);
  static const blueTitle = Color(0xFF0000F6);

  //! BUTTON COLORS
  static const disabledButtonColor = Color(0xFFFFE394);
  static const defaultButtonColor = Color(0xFFFFC62A);
  static const pressedButtonColor = Color(0xFFF5B506);
  static const defaultLabelButtonColor = Color(0xFF795A3E);
  static const disabledLabelButtonColor = Color(0xFF867261);
  static const moduleButtonColor = Color(0xFFF4CE66);
  static const moduleButtonLabelColor = Color(0xFF7A5B3E);

  //! FORM FIELD COLORS
  static const formFieldLabelColor = Color(0xFF7A5B3E);
  static const formFieldBackgroundColor = Color(0xFFF4CE66);
  static const formFieldDefaultBorderColor = Color(0xFFFFC62A);
  static const formFieldSelectedBorderColor = Color(0xFF7A5B3E);
  static const formFieldTextColor = Color(0xFF7A5B3E);
  static const loginScreenForget = Color(0xFF000000);
  static const loginScreenRegister = Color(0xFFF82222);
  static const formFieldGrayBorder = Color(0xFF676767);
  static const formFieldRedBorder = Color(0xFFC90202);
  static const formFieldGreenBorder = Color(0xFF09F401);
}
