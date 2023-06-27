import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class HoneyBeeCardPlan extends StatelessWidget {
  const HoneyBeeCardPlan(
      {super.key,
      required this.backgroundColor,
      this.onTap,
      required this.planTitle,
      required this.planDescription,
      required this.icon,
      required this.planDataText,
      required this.planValue});

  final Color backgroundColor;
  final Function()? onTap;
  final String planTitle;
  final String planDescription;
  final Widget icon;
  final String planValue;
  final String planDataText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async =>
            Modular.to.pushNamed(NamedRoutes.CREATEACCOUNTFOLLOWFIGHTERS),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planTitle,
                style: HoneyBeeText.h1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                planDescription,
                style: TextStyle(
                    fontSize: 14, color: AppColors.colorScheme.onPrimary),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  leading: icon,
                  title: Text(planDataText),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(planValue, style: HoneyBeeText.price)
            ],
          ),
        ),
      ),
    );
  }
}
