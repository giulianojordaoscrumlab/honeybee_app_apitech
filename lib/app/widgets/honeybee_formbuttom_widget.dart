import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeFormButton extends StatelessWidget {
  final Function()? onPressed;
  final bool enabled;
  final Color backgroundColor;
  final double height;
  final double width;
  final double borderRadius;
  final Color borderColor;
  final String labelText;
  final Color labelColor;
  final TextStyle labelStyle;

  const HoneyBeeFormButton(
      {super.key,
      this.onPressed,
      this.enabled = true,
      this.backgroundColor = AppColors.primary1,
      this.height = 60.0,
      this.width = 200.0,
      this.borderRadius = 16.0,
      this.borderColor = AppColors.primary1,
      required this.labelText,
      this.labelColor = AppColors.primary4,
      this.labelStyle = HoneyBeeText.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: (backgroundColor != AppColors.primary1)
            ? MaterialStateColor.resolveWith((states) => backgroundColor)
            : MaterialStateColor.resolveWith(resolveBackgroundColors),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.resolveWith(resolveLabelColors),
        alignment: Alignment.center,
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
      onPressed: (enabled == true) ? onPressed : null,
      child: Text(
        labelText,
        style: labelStyle,
      ),
    );
  }

  static const Color _defaultColor = AppColors.primary1;
  static const Color _disabledColor = AppColors.disabledButtonColor;
  static const Color _pressedColor = AppColors.disabledButtonColor;

  static const Color _defaultLabelColor = AppColors.primary4;
  static const Color _disabledLabelColor = AppColors.primary4;
  static const Color _pressedLabelColor = AppColors.primary4;

  Color resolveBackgroundColors(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return _pressedColor;
    } else if (states.contains(MaterialState.disabled)) {
      return _disabledColor;
    } else {
      return _defaultColor;
    }
  }

  Color resolveLabelColors(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return _pressedLabelColor;
    } else if (states.contains(MaterialState.disabled)) {
      return _disabledLabelColor;
    } else {
      return _defaultLabelColor;
    }
  }
}
