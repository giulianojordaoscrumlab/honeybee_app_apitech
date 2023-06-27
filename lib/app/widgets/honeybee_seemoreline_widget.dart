import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeSeeMoreLine extends StatefulWidget {
  const HoneyBeeSeeMoreLine({super.key, this.message, this.onPress});

  final String? message;
  final Function()? onPress;

  @override
  State<HoneyBeeSeeMoreLine> createState() => _HoneyBeeSeeMoreLineState();
}

class _HoneyBeeSeeMoreLineState extends State<HoneyBeeSeeMoreLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.primary4.withOpacity(0.3),
            width: 0.5,
          ),
          top: BorderSide(
            color: AppColors.primary4.withOpacity(0.3),
            width: 0.5,
          ),
        ),
      ),
      child: InkWell(
        splashColor: AppColors.primary1.withOpacity(0.3),
        highlightColor: AppColors.primary1.withOpacity(0.2),
        hoverColor: AppColors.primary1.withOpacity(0.1),
        onTap: widget.onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.message ?? "Ver mais",
                style: HoneyBeeText.caption.copyWith(
                  color: AppColors.primary4,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary4,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
