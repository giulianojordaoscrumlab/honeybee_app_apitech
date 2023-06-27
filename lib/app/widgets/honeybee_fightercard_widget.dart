import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class HoneyBeeFighterCard extends StatefulWidget {
  final double? screenHeight;
  final String? imageUrl;
  final String? category;
  final String? sId;
  final String? name;
  final String? wld; //? wins-looses-defs
  final int? ranking;
  final bool? hallOfFame;

  const HoneyBeeFighterCard({
    super.key,
    this.screenHeight,
    this.imageUrl,
    this.category,
    this.sId,
    this.name,
    this.wld = "1-0-0",
    this.ranking = 1,
    this.hallOfFame = false,
  });

  @override
  State<HoneyBeeFighterCard> createState() => _HoneyBeeFighterCardState();
}

class _HoneyBeeFighterCardState extends State<HoneyBeeFighterCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary2,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        splashColor: AppColors.primary1.withOpacity(0.3),
        highlightColor: AppColors.primary1.withOpacity(0.2),
        hoverColor: AppColors.primary1.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        // onTap: () => (widget.hallOfFame == false)
        //     ? Modular.to.pushNamed(
        //         NamedRoutes.FIGHTERSDETAILS,
        //         arguments: {"sId": widget.sId.toString()},
        //       )
        // :
        onTap: () => Modular.to.pushNamed(
          NamedRoutes.FIGHTERSV2,
          arguments: {"sId": widget.sId.toString()},
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: widget.screenHeight! * 0.20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Image.network(
                      widget.imageUrl ?? "",
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
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
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.category ?? "",
                    style: HoneyBeeText.cardTitle.copyWith(
                      fontSize: 14,
                      color: AppColors.primary4.withOpacity(0.7),
                    ),
                  ),
                ),
                //! Ranking Seal

                Row(
                  children: [
                    (widget.ranking!.toInt() > 0)
                        ? Visibility(
                            visible:
                                (widget.ranking!.toInt() > 0) ? true : false,
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 10),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppColors.primary1,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                widget.ranking!.toString(),
                                style: HoneyBeeText.small.copyWith(
                                  color: AppColors.primary4,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Text(
                          widget.name!.length > 18
                              ? widget.name!.substring(0, 15) + '...'
                              : widget.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: HoneyBeeText.cardTitle.copyWith(
                            fontSize: 18,
                            color: AppColors.primary4.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: widget.ranking!.toInt() > 0 ? 45 : 10),
                  child: Text(
                    widget.wld ?? "",
                    style: HoneyBeeText.cardTitle.copyWith(
                        fontSize: 16,
                        color: AppColors.primary4.withOpacity(0.9),
                        fontWeight: FontWeight.bold),
                  ),
                ),

                //! Fighter WLD

                // //! Fighter Follow
                // Positioned(
                //   // padding: const EdgeInsets.symmetric(horizontal: 10),
                //   bottom: 5,
                //   left: 42,
                //   child: ElevatedButton(
                //     style: ButtonStyle(
                //       textStyle: MaterialStatePropertyAll<TextStyle>(
                //         HoneyBeeText.buttonLabel.copyWith(
                //           color: AppColors.primary4,
                //         ),
                //       ),
                //       backgroundColor: const MaterialStatePropertyAll<Color>(
                //         AppColors.primary1,
                //       ),
                //     ),
                //     onPressed: () {
                //       if (kDebugMode) {
                //         print("....");
                //       }
                //     },
                //     child: const Text(
                //       "SEGUIR",
                //       style: HoneyBeeText.buttonLabel,
                //     ),
                //   ),
                // ),
              ],
            ),
            widget.hallOfFame!
                ? Positioned(
                    top: 175,
                    right: 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/v2/jfBelt_selected.png',
                        width: 60,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
