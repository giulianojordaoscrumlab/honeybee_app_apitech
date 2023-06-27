import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';

class HoneyBeeTheme {
  static ThemeData get themeData => ThemeData(
        colorScheme: AppColors.colorScheme,
        useMaterial3: true,
        fontFamily: 'Raleway',
        brightness: AppColors.brightness,
        hoverColor: AppColors.primary1.withOpacity(0.1),
        splashColor: AppColors.primary1.withOpacity(0.3),
        highlightColor: AppColors.primary1.withOpacity(0.2),
      );
}
