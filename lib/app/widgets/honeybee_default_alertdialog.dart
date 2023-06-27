import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class HoneyBeeDefaultAlertDialog extends AwesomeDialog {
  final BuildContext mainContext;
  final String? mainTitle;
  final String? subtitle;
  final String? description;

  HoneyBeeDefaultAlertDialog({
    required this.mainContext,
    this.mainTitle,
    this.subtitle,
    this.description,
  }) : super(context: mainContext);

  build() {
    return AwesomeDialog(
      alignment: Alignment.center,
      bodyHeaderDistance: 25,
      // borderSide:
      //     const BorderSide(color: AppColors.formFieldGrayBorder, width: 2.0),
      buttonsBorderRadius: BorderRadius.circular(12),
      customHeader: Container(
        decoration: BoxDecoration(
          color: AppColors.primary4,
          boxShadow: const [
            BoxShadow(
                offset: Offset(-3, 3),
                spreadRadius: -1,
                blurRadius: 8,
                color: AppColors.formFieldGrayBorder),
          ],
          borderRadius: BorderRadius.circular(100),
          // border: Border.all(
          //   color: AppColors.formFieldGrayBorder,
          //   width: 2,
          // ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mainTitle ?? "Ops!",
            style: HoneyBeeText.h1.copyWith(
              color: AppColors.primary1,
            ),
          ),
          Text(
            subtitle ?? "Alguma informação não confere!",
            style: HoneyBeeText.h2.copyWith(
              color: AppColors.formFieldGrayBorder,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          (description!.isEmpty)
              ? InkWell(
                  onTap: () => Modular.to.navigate(NamedRoutes.CREATEUSER),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Confira o e-mail e a senha ou ",
                          style: HoneyBeeText.h3.copyWith(
                            color: AppColors.formFieldGrayBorder,
                          ),
                        ),
                        TextSpan(
                          text: "cadastre-se",
                          style: HoneyBeeText.h3.copyWith(
                            color: AppColors.primary1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Text(
                  description!,
                  style: HoneyBeeText.h3.copyWith(
                    color: AppColors.formFieldGrayBorder,
                  ),
                ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
      transitionAnimationDuration: const Duration(milliseconds: 300),
      context: context,
      btnOkText: "OK",
      width: MediaQuery.of(context).size.width * 0.9,
      btnOkColor: AppColors.primary1,
      btnOkOnPress: () => {},
      animType: AnimType.scale,
      barrierColor: AppColors.blackTitle.withOpacity(0.6),
      dialogBackgroundColor: AppColors.primary4,
      dialogType: DialogType.warning,
      isDense: true,
    ).show();
  }
}
