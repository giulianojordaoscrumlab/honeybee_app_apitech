import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/icons/icons_package_honeybee.dart';

class HoneyBeeSearchFieldFullsize extends StatefulWidget {
  const HoneyBeeSearchFieldFullsize({super.key, required this.screenWidth});
  final double screenWidth;
  @override
  State<HoneyBeeSearchFieldFullsize> createState() =>
      _HoneyBeeSearchFieldFullsizeState();
}

class _HoneyBeeSearchFieldFullsizeState
    extends State<HoneyBeeSearchFieldFullsize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      height: 50,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: widget.screenWidth * 0.70,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.formFieldGrayBorder,
                width: 1,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              HoneyBeeIcons.search,
              color: AppColors.primary4,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
