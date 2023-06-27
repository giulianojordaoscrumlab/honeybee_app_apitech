import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';

class HoneyBeeHorizontalLineSeparator extends StatefulWidget {
  final double heigth;
  final double lineHeight;
  final double horizontalPadding;
  final Color color1;
  final Color color2;

  const HoneyBeeHorizontalLineSeparator({
    super.key,
    this.heigth = 20,
    this.lineHeight = 3,
    this.horizontalPadding = 0,
    this.color1 = AppColors.primary1,
    this.color2 = AppColors.transparent,
  });

  @override
  State<HoneyBeeHorizontalLineSeparator> createState() =>
      _HoneyBeeHorizontalLineSeparatorState();
}

class _HoneyBeeHorizontalLineSeparatorState
    extends State<HoneyBeeHorizontalLineSeparator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.heigth,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
          ),
          width: double.infinity,
          height: widget.lineHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
