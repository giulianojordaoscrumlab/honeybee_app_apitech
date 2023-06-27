import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/models/fighter_model.dart';
import 'package:honeybee/app/models/retornofights_model.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class MainFightCard extends StatelessWidget {
  const MainFightCard({
    super.key,
    required this.fighter1,
    required this.fighter2,
    required this.header,
    required this.jfBelt,
    required this.fight,
  });

  final FighterModel fighter1;
  final FighterModel fighter2;
  final Fight fight;
  final bool jfBelt;

  final List<Widget> header;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Modular.to.pop();
              // Modular.to.pushNamed(NamedRoutes.FIGHTSSTATS,
              //     arguments: {fight: fight});
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.network(
                                fighter1.fightDetailPhoto ?? "",
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomLeft,
                                height: 250,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          AppColors.primary1.withOpacity(0.3),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Image.network(
                                fighter2.fightDetailPhoto!,
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomRight,
                                height: 250,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          AppColors.primary1.withOpacity(0.3),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 195,
                    bottom: 70,
                    child: SizedBox(
                      width: 60,
                      child: (jfBelt == true)
                          ? Image.asset(
                              "assets/images/v2/jfBelt.png",
                              width: 24,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: header,
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 150,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.7]),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${fighter1.name}'.toUpperCase(),
                                  style: HoneyBeeText.h5,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${fighter1.category}'.toUpperCase(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.colorScheme.onBackground
                                        .withOpacity(0.7),
                                  ),
                                ),
                                (fighter1.winner == true)
                                    ? const Text(
                                        'Vencedor',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          SizedBox(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${fighter2.name}'.toUpperCase(),
                                  style: HoneyBeeText.h5,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${fighter2.category}'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colorScheme.onBackground
                                          .withOpacity(0.7)),
                                ),
                                (fighter2.winner == true)
                                    ? const Text(
                                        'Vencedor',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary1,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
