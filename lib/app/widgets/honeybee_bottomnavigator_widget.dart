import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class HoneyBeeBottomNavHive extends StatelessWidget {
  const HoneyBeeBottomNavHive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        width: MediaQuery.of(context).size.width,
        color: AppColors.transparent,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () => Modular.to.navigate(NamedRoutes.HIVES),
            child: Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                    image: Image.asset(
                      "assets/images/backgrounds/hive_bg.png",
                      alignment: Alignment.center,
                    ).image,
                  ),
                ),
                child: Center(
                  child: Text("COLMÉIAS",
                      style: HoneyBeeText.h6.copyWith(
                          color: AppColors.defaultLabelButtonColor,
                          fontWeight: FontWeight.w600)),
                )),
          ),
          InkWell(
            onTap: () => Modular.to.navigate(NamedRoutes.APIARIES),
            child: Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                    image: Image.asset(
                      "assets/images/backgrounds/hive_bg.png",
                      alignment: Alignment.topCenter,
                    ).image,
                  ),
                ),
                child: Center(
                  child: Text("APIÁRIOS",
                      style: HoneyBeeText.h6.copyWith(
                          color: AppColors.defaultLabelButtonColor,
                          fontWeight: FontWeight.w600)),
                )),
          ),
          InkWell(
            onTap: () => Modular.to.navigate(NamedRoutes.JOURNALS),
            child: Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                    image: Image.asset(
                      "assets/images/backgrounds/hive_bg.png",
                      alignment: Alignment.topCenter,
                    ).image,
                  ),
                ),
                child: Center(
                  child: Text("DIÁRIOS",
                      style: HoneyBeeText.h6.copyWith(
                          color: AppColors.defaultLabelButtonColor,
                          fontWeight: FontWeight.w600)),
                )),
          ),
          InkWell(
            onTap: () => Modular.to.navigate(NamedRoutes.BEES),
            child: Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                    image: Image.asset(
                      "assets/images/backgrounds/hive_bg.png",
                      alignment: Alignment.topCenter,
                    ).image,
                  ),
                ),
                child: Center(
                  child: Text("ABELHAS",
                      style: HoneyBeeText.h6.copyWith(
                          color: AppColors.defaultLabelButtonColor,
                          fontWeight: FontWeight.w600)),
                )),
          ),
          InkWell(
            onTap: () => Modular.to.navigate(NamedRoutes.PROFILE),
            child: Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                    image: Image.asset(
                      "assets/images/backgrounds/hive_bg.png",
                      alignment: Alignment.topCenter,
                    ).image,
                  ),
                ),
                child: Center(
                  child: Text("PERFIL",
                      style: HoneyBeeText.h6.copyWith(
                          color: AppColors.defaultLabelButtonColor,
                          fontWeight: FontWeight.w600)),
                )),
          ),
        ]),
      ),
    );
  }
}
