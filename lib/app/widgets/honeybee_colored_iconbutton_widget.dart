import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeColoredButton extends StatefulWidget {
  final String coloredIcon;
  final Color backgroundColor;
  final Color borderColor;
  final bool enabled;
  final String buttonLabel;
  final TextStyle labelStyle;
  final double height;
  final double width;
  final double borderRadius;
  final Function()? onPressed;
  final double horizontalMargin;
  final double innerPadding;
  final MaterialStatesController statesController;
  final bool fullSize;
  final bool noBorder;

  const HoneyBeeColoredButton({
    super.key,
    required this.coloredIcon,
    this.backgroundColor = AppColors.primary1,
    this.borderColor = AppColors.primary1,
    this.enabled = true,
    this.buttonLabel = "",
    this.innerPadding = 8.0,
    this.height = 55,
    this.width = 400,
    this.borderRadius = 0.0,
    this.horizontalMargin = 24,
    this.labelStyle = HoneyBeeText.buttonLabel,
    required this.onPressed,
    required this.statesController,
    this.fullSize = true,
    this.noBorder = true,
  });

  @override
  State<HoneyBeeColoredButton> createState() => _HoneyBeeColoredButtonState();

  static const Color _defaultColor = AppColors.primary1;
  static const Color _disabledColor = AppColors.primary5;
  static const Color _pressedColor = AppColors.pressedButtonColor;

  static const Color _defaultLabelColor = AppColors.primary4;
  static const Color _disabledLabelColor = AppColors.primary4;
  static const Color _pressedLabelColor = AppColors.primary4;
}

class _HoneyBeeColoredButtonState extends State<HoneyBeeColoredButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.horizontalMargin,
        right: widget.horizontalMargin,
        bottom:
            (widget.horizontalMargin <= 0) ? 12 : widget.horizontalMargin / 2,
      ),
      child: ElevatedButton(
        statesController: widget.statesController,
        style: ButtonStyle(
          backgroundColor: widget.backgroundColor != AppColors.primary1
              ? MaterialStateColor.resolveWith(
                  (states) => widget.backgroundColor)
              : MaterialStateColor.resolveWith(
                  resolveBackgroundColorsColoredIconButton),
          elevation: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.resolveWith(
              resolveLabelColorsColoredIconButton),
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(Size(
              widget.width - (widget.horizontalMargin * 2), widget.height)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              side: widget.noBorder
                  ? const BorderSide(
                      width: 0,
                      color: AppColors.primary4,
                    )
                  : BorderSide(
                      width: 2,
                      color: (widget.backgroundColor != AppColors.primary1)
                          ? MaterialStateColor.resolveWith(
                              (states) => widget.borderColor)
                          : MaterialStateColor.resolveWith(
                              resolveBackgroundColorsColoredIconButton)),
            ),
          ),
        ),
        onPressed: (widget.enabled == true) ? widget.onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            (widget.enabled)
                ? SvgPicture.asset(widget.coloredIcon,
                    height: widget.height - widget.innerPadding)
                : ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary5, BlendMode.screen),
                    child: SvgPicture.asset(
                      widget.coloredIcon,
                      height: widget.height - widget.innerPadding,
                    ),
                  ),
            SizedBox(
              width: widget.innerPadding,
            ),
            SizedBox(
              width: widget.width * 0.45,
              child: Text(
                textAlign: TextAlign.start,
                widget.buttonLabel,
                maxLines: 2,
                softWrap: true,
                style: (widget.fullSize)
                    ? widget.labelStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )
                    : widget.labelStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
              ),
            ),
            // (widget.fullSize)
            //     ? const Spacer(
            //         flex: 3,
            //       )
            //     : const Spacer(
            //         flex: 1,
            //       ),
          ],
        ),
      ),
    );
  }

  Color resolveBackgroundColorsColoredIconButton(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return HoneyBeeColoredButton._pressedColor;
    } else if (states.contains(MaterialState.disabled)) {
      return HoneyBeeColoredButton._disabledColor;
    } else {
      return HoneyBeeColoredButton._defaultColor;
    }
  }

  Color resolveLabelColorsColoredIconButton(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return HoneyBeeColoredButton._pressedLabelColor;
    } else if (states.contains(MaterialState.disabled)) {
      return HoneyBeeColoredButton._disabledLabelColor;
    } else {
      return HoneyBeeColoredButton._defaultLabelColor;
    }
  }
}
