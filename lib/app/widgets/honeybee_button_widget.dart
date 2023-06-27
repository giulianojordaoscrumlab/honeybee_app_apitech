import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeButton extends StatelessWidget {
  const HoneyBeeButton(
      {super.key,
      this.onPressed,
      this.enabled = true,
      this.background = AppColors.primary,
      required this.child});

  final void Function()? onPressed;
  final Color? background;
  final Widget child;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: FilledButton(
        onPressed: onPressed,
        child: child,
        style: FilledButton.styleFrom(
          backgroundColor:
              (enabled == true) ? background : AppColors.disabledButtonColor,
          textStyle: (enabled == true)
              ? HoneyBeeText.buttonLabel
              : HoneyBeeText.buttonLabel.copyWith(
                  color: AppColors.primary3,
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
