import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/models/fighter_model.dart';
import 'package:honeybee/app/models/retornofights_model.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class CardsTile extends StatelessWidget {
  const CardsTile(
      {super.key,
      required this.fighter1,
      required this.fighter2,
      required this.fightData,
      required this.matchIndex,
      required this.jfBelt});

  final Fight fightData;
  final bool jfBelt;
  final int matchIndex;
  final FighterModel fighter1;
  final FighterModel fighter2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(NamedRoutes.FIGHTSSTATS, arguments: {
          "fight": fightData,
          "match": matchIndex,
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${fighter1.name}'.toUpperCase(),
                      style: HoneyBeeText.h4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${fighter1.category}'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color:
                            AppColors.colorScheme.onBackground.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.network(
                      '${fighter1.fightCardPhoto}',
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                      height: 80,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary1.withOpacity(0.3),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  (fighter1.winner == true)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Vencedor',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            (jfBelt == true)
                ? Image.asset(
                    "assets/images/v2/jfBelt.png",
                    width: 32,
                  )
                : Container(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.network(
                      '${fighter2.fightCardPhoto}',
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                      height: 80,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primary1.withOpacity(0.3),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  (fighter2.winner == true)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Vencedor',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${fighter2.name}'.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: HoneyBeeText.h4,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${fighter2.category}'.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorScheme.onBackground
                              .withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
