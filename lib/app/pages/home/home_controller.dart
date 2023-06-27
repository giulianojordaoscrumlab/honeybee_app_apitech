import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honeybee/app/models/countdowndata_model.dart';
import 'package:honeybee/app/models/drawer_model.dart';
import 'package:honeybee/app/models/mainmenu_model.dart';
import 'package:honeybee/app/models/retornofights_model.dart';
import 'package:honeybee/app/models/retornologin_model.dart';
import 'package:honeybee/app/models/retornonews_model.dart';
import 'package:honeybee/app/pages/home/home_repository.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/enums.dart';
import 'package:honeybee/const/icons/icons_package_honeybee.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/shared/enum.dart';
import 'package:honeybee/shared/prefs.dart';

class HomeController extends ChangeNotifier {
  final repository = HomeRepository();

  final freePlan = false;

  int selectedBottomNavigatorIndex = 0;

  double screenHeight = 0;
  double screenWidth = 0;

  CountdownData countDownData = const CountdownData(
    dias: 4,
    horas: 16,
    minutos: 35,
    segundos: 16,
  );

  MainMenuState mainMenuState = MainMenuState.empty;
  DrawerState drawerState = DrawerState.empty;

  ModelRetornoLogin? retornoLogin;

  ModelMainMenu? mainMenuStructure;

  List<Widget>? listaMenuItems;
  List<Widget>? listaDrawerItems;

  String? apelido;

  ModelDrawer? drawerData;

  ModelStates pageState = ModelStates.idle;

  doLoading() {
    pageState = ModelStates.loading;
    notifyListeners();
  }

  stopLoading() {
    pageState = ModelStates.idle;
    notifyListeners();
  }

  getLoggedUserFromPrefs() async {
    var retornoLoginStr = await Prefs.getString("retornoLogin");
    retornoLogin = ModelRetornoLogin.fromJson(json.decode(retornoLoginStr));
    notifyListeners();
  }

  setCountDownData(value) {
    if (value != null) {
      DateTime diffDate = DateTime.parse(value);
      DateTime tempDate = DateTime.now();
      var durationSeconds = diffDate.difference(tempDate).inSeconds;
      int days = durationSeconds ~/ (24 * 60 * 60);
      int hours = (durationSeconds ~/ (60 * 60)) % 24;
      int minutes = (durationSeconds ~/ 60) % 60;
      int seconds = durationSeconds % 60;

      countDownData = CountdownData(
        dias: days,
        horas: hours,
        minutos: minutes,
        segundos: seconds,
      );
    }
  }

  Timer? countDownTimer;

  Duration countDownTotalDuration =
      const Duration(days: 4, hours: 16, minutes: 35, seconds: 16);

  void startTimer() {
    countDownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountdown());
  }

  void stopTimer() {
    stopTimer();
    countDownTotalDuration = const Duration(days: 5);
    notifyListeners();
  }

  void resetTimer() {
    stopTimer();
    countDownTotalDuration = const Duration(days: 5);
  }

  void setCountdown() {
    const reduceSecondsBy = 1;

    final seconds = countDownTotalDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countDownTimer!.cancel();
    } else {
      countDownTotalDuration = Duration(seconds: seconds);
    }
  }

  setSelectedBottomNavigatorIndex(value) {
    doLoading();
    selectedBottomNavigatorIndex = value;
    stopLoading();
  }

  getDrawerStrucuture(BuildContext context) async {
    drawerState = DrawerState.empty;
    notifyListeners();

    await repository.getDrawerStructure(true, context).then((value) {
      drawerData = value;
      montaDrawerMenu(context);
      drawerState = DrawerState.initialized;
      notifyListeners();
    });
  }

  loadLoggedUserData() async {
    mainMenuState = MainMenuState.empty;
    mainMenuState = MainMenuState.complete;
    notifyListeners();
  }

  // getMainMenuStrucuture(BuildContext context) async {
  //   await repository.getMainMenuStructure(true, context).then((value) {
  //     mainMenuStructure = value;
  //     montaMainMenu(MediaQuery.of(context).size.width);

  //     mainMenuState = MainMenuState.initialized;
  //     notifyListeners();
  //   });
  // }

  montaDrawerMenu(BuildContext context) {
    listaDrawerItems = [];

    drawerState = DrawerState.empty;

    Widget tempWidget = Container();

    for (var index = 0; index <= drawerData!.drawerItems!.length - 1; index++) {
      var drawerItem = drawerData!.drawerItems!.elementAt(index);

      var childrens = <Widget>[];

      drawerItem.childrens?.map((item) {
        childrens.add(
          InkWell(
            onTap: () => Modular.to.pushNamed(item.route!),
            splashColor: AppColors.primary1.withOpacity(0.3),
            highlightColor: AppColors.primary1.withOpacity(0.2),
            hoverColor: AppColors.primary1.withOpacity(0.1),
            child: Container(
              decoration: const BoxDecoration(color: AppColors.primary3),
              alignment: Alignment.centerLeft,
              height: 55,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                item.label!,
                style: HoneyBeeText.drawerLabel.copyWith(
                  color: AppColors.primary4,
                ),
              ),
            ),
          ),
        );
      }).toList();

      switch (drawerItem.type) {
        case "iconbutton":
          if (drawerItem.expandable == true) {
            tempWidget = Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Row(
                  children: [
                    (drawerItem.iconType == "icon")
                        ? (drawerItem.icon! == "junglepass")
                            ? const Icon(
                                HoneyBeeDrawerIcons.junglepass,
                                color: AppColors.primary4,
                              )
                            : (drawerItem.icon! == "partners")
                                ? const Icon(
                                    HoneyBeeDrawerIcons.partners,
                                    color: AppColors.primary4,
                                  )
                                : (drawerItem.icon! == "universojungle")
                                    ? const Icon(
                                        HoneyBeeDrawerIcons.shop,
                                        color: AppColors.primary4,
                                      )
                                    : (drawerItem.icon! == "profile")
                                        ? const Icon(
                                            HoneyBeeDrawerIcons.profile,
                                            color: AppColors.primary4,
                                          )
                                        : (drawerItem.icon! == "videos")
                                            ? const Icon(
                                                Icons.video_collection_outlined,
                                                color: AppColors.primary4,
                                              )
                                            : Container()
                        : SvgPicture.asset(
                            drawerItem.icon.toString(),
                          ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      drawerItem.label!,
                      style: HoneyBeeText.drawerLabel.copyWith(
                        color: AppColors.primary4,
                      ),
                    ),
                  ],
                ),
                backgroundColor: AppColors.primary2,
                collapsedBackgroundColor: AppColors.primary2,
                children: childrens,
                iconColor: AppColors.primary4,
                initiallyExpanded: false,
              ),
            );
            listaDrawerItems?.add(tempWidget);
          } else {
            tempWidget = InkWell(
              splashColor: AppColors.primary1.withOpacity(0.3),
              highlightColor: AppColors.primary1.withOpacity(0.2),
              hoverColor: AppColors.primary1.withOpacity(0.1),
              onTap: () => Modular.to.pushNamed(drawerItem.route!),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 55,
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Row(
                  children: [
                    (drawerItem.iconType == "icon")
                        ? (drawerItem.icon! == "junglepass")
                            ? const Icon(
                                HoneyBeeDrawerIcons.junglepass,
                                color: AppColors.primary4,
                              )
                            : (drawerItem.icon! == "partners")
                                ? const Icon(
                                    HoneyBeeDrawerIcons.partners,
                                    color: AppColors.primary4,
                                  )
                                : (drawerItem.icon! == "universojungle")
                                    ? const Icon(
                                        HoneyBeeDrawerIcons.shop,
                                        color: AppColors.primary4,
                                      )
                                    : (drawerItem.icon! == "profile")
                                        ? const Icon(
                                            HoneyBeeDrawerIcons.profile,
                                            color: AppColors.primary4,
                                          )
                                        : (drawerItem.icon! == "videos")
                                            ? const Icon(
                                                Icons.video_collection_outlined,
                                                color: AppColors.primary4,
                                              )
                                            : Container()
                        : SvgPicture.asset(
                            drawerItem.icon.toString(),
                          ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      drawerItem.label!,
                      style: HoneyBeeText.drawerLabel.copyWith(
                        color: AppColors.primary4,
                      ),
                    ),
                  ],
                ),
              ),
            );
            listaDrawerItems?.add(tempWidget);
          }
          break;
        //! Separator line only
        case "separator":
          tempWidget = Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.formFieldGrayBorder,
                  width: 1.0,
                ),
              ),
            ),
            height: 20,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 8),
          );
          listaDrawerItems?.add(tempWidget);
          break;
        //! Separator with text label
        case "labelseparator":
          tempWidget = Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.formFieldGrayBorder,
                  width: 1.0,
                ),
              ),
            ),
            height: 30,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                drawerItem.label!,
                style: HoneyBeeText.h4.copyWith(
                  color: AppColors.primary1,
                  fontSize: 18,
                ),
              ),
            ),
          );
          listaDrawerItems?.add(tempWidget);
          break;
        //! Button
        case "button":
          tempWidget = InkWell(
            enableFeedback: true,
            highlightColor: AppColors.primary1.withOpacity(0.45),
            hoverColor: (drawerItem.enabled == false)
                ? AppColors.formFieldGrayBorder.withOpacity(0.05)
                : AppColors.formFieldGrayBorder.withOpacity(0.45),
            onTap: () => (drawerItem.enabled == false)
                ? {}
                : Modular.to.pushNamed(drawerItem.route!),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 55,
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: Text(
                drawerItem.label!,
                style: HoneyBeeText.drawerLabel.copyWith(
                  color: (drawerItem.enabled == false)
                      ? AppColors.primary4.withOpacity(0.45)
                      : AppColors.primary4,
                ),
              ),
            ),
          );
          listaDrawerItems?.add(tempWidget);
          break;
        default:
          break;
      }
    }

    drawerState = DrawerState.complete;
    notifyListeners();
  }

  // montaMainMenu(screenWidth) {
  //   listaMenuItems = [];
  //   mainMenuState = MainMenuState.empty;

  //   Widget tempWidget = Container();

  //   for (var index = 0;
  //       index <= mainMenuStructure!.buttons!.length - 1;
  //       index++) {
  //     var button = mainMenuStructure!.buttons!.elementAt(index);

  //     if (button.fullsize == true) {
  //       tempWidget = HoneyBeeColoredButton(
  //         coloredIcon: button.icon.toString(),
  //         enabled: button.enabled ?? false,
  //         height: 61,
  //         width: (button.fullsize! == true) ? screenWidth : screenWidth / 2,
  //         horizontalMargin: (button.fullsize == true) ? 24 : 12,
  //         fullSize: button.fullsize!,
  //         innerPadding: 8,
  //         backgroundColor: AppColors.primary1,
  //         buttonLabel: button.title.toString(),
  //         noBorder: true,
  //         onPressed: () {
  //           if (button.route == true) {
  //             Modular.to.navigate(button.namedRoute.toString());
  //           } else {
  //             button.function;
  //           }
  //         },
  //         statesController: MaterialStatesController({MaterialState.disabled}),
  //       );
  //     } else {
  //       var tempWidget1 = HoneyBeeColoredButton(
  //         coloredIcon: button.icon.toString(),
  //         enabled: button.enabled ?? false,
  //         height: 61,
  //         width: (button.fullsize! == true) ? screenWidth : screenWidth * 0.43,
  //         horizontalMargin: 0,
  //         fullSize: button.fullsize!,
  //         innerPadding: 8,
  //         backgroundColor: AppColors.primary1,
  //         buttonLabel: button.title.toString(),
  //         noBorder: true,
  //         onPressed: () {
  //           if (button.route == true) {
  //             Modular.to.navigate(button.namedRoute.toString());
  //           } else {
  //             button.function;
  //           }
  //         },
  //         statesController: MaterialStatesController({MaterialState.disabled}),
  //       );

  //       button = mainMenuStructure!.buttons!.elementAt(index + 1);

  //       var tempWidget2 = HoneyBeeColoredButton(
  //         coloredIcon: button.icon.toString(),
  //         enabled: button.enabled ?? false,
  //         height: 61,
  //         width: (button.fullsize! == true) ? screenWidth : screenWidth * 0.43,
  //         horizontalMargin: 0,
  //         fullSize: button.fullsize!,
  //         innerPadding: 8,
  //         backgroundColor: AppColors.primary1,
  //         buttonLabel: button.title.toString(),
  //         noBorder: true,
  //         onPressed: () {
  //           if (button.route == true) {
  //             Modular.to.navigate(button.namedRoute.toString());
  //           } else {
  //             button.function;
  //           }
  //         },
  //         statesController: MaterialStatesController({MaterialState.disabled}),
  //       );

  //       tempWidget = Padding(
  //         padding: const EdgeInsets.only(
  //           left: 24.0,
  //           right: 24.0,
  //           bottom: 12.0,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             tempWidget1,
  //             const Spacer(flex: 1),
  //             tempWidget2,
  //           ],
  //         ),
  //       );

  //       mainMenuStructure!.buttons!.removeAt(index + 1);
  //     }

  //     listaMenuItems!.add(tempWidget);
  //   }
  //   mainMenuState = MainMenuState.initialized;
  //   notifyListeners();
  // }

  setScreenHeight(value) => screenHeight = value;
  setScreenWidth(value) => screenWidth = value;

  List<News>? listaNewsHome;
  ModelRetornoNews? retornoNews;

  ModelRetornoFights? retornoFights;
  List<Fight>? listaFightsHome;

  Fight? nextFight;

  getNewsToHome() async {
    doLoading();
    retornoNews = await repository.getNewsHome();
    listaNewsHome = retornoNews?.body?.news;

    listaNewsHome!.sort((a, b) => DateTime.parse(b.publishedAt.toString())
        .compareTo(DateTime.parse(a.publishedAt.toString())));

    var tempList = listaNewsHome!.take(2);
    listaNewsHome = tempList.toList();

    stopLoading();
    return null;
  }

  getNextFirstFightToHome() async {
    doLoading();

    nextFight = listaFightsHome?.firstWhere(
        (el) => DateTime.parse(el.eventDate!).isAfter(DateTime.now()));

    stopLoading();
    return null;
  }

  getFightsToHome() async {
    doLoading();

    retornoFights = await repository.getFightsHome();

    listaFightsHome = retornoFights?.body?.fights;

    listaFightsHome!.sort((a, b) => DateTime.parse(b.eventDate.toString())
        .compareTo(DateTime.parse(a.eventDate.toString())));

    var tempList = listaFightsHome!.take(2);
    listaFightsHome = tempList.toList();

    getNextFirstFightToHome();

    stopLoading();
  }

//   Widget drawMainMenuHeader(context) {
//     return (mainMenuStructure == null ||
//             mainMenuState != MainMenuState.initialized)
//         ? const CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary1),
//           )
//         : Container(
//             margin: const EdgeInsets.only(top: 32, bottom: 16),
//             height: screenHeight * 0.18,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 (mainMenuStructure!.header!.icon!.contains("svg"))
//                     ? SvgPicture.asset(
//                         mainMenuStructure!.header!.icon!,
//                         height: screenHeight * 0.12,
//                         fit: BoxFit.cover,
//                       )
//                     : Image.asset(
//                         mainMenuStructure!.header!.icon!,
//                         height: screenHeight * 0.12,
//                         fit: BoxFit.cover,
//                       ),
//                 Text(
//                   mainMenuStructure!.header!.title!,
//                   style: HoneyBeeText.h1.copyWith(color: AppColors.primary1),
//                 ),
//               ],
//             ),
//           );
//   }
}
