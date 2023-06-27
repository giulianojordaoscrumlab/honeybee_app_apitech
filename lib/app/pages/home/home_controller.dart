import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honeybee/app/models/countdowndata_model.dart';
import 'package:honeybee/app/models/drawer_model.dart';
import 'package:honeybee/app/models/mainmenu_model.dart';
import 'package:honeybee/app/models/retornoapiaries_model.dart';
import 'package:honeybee/app/models/retornofights_model.dart';
import 'package:honeybee/app/models/retornologin_model.dart';
import 'package:honeybee/app/pages/home/home_repository.dart';
import 'package:honeybee/const/enums.dart';
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

  getApiaries() async {}

  getHives() async {}

  setSelectedBottomNavigatorIndex(value) {
    doLoading();
    selectedBottomNavigatorIndex = value;
    stopLoading();
  }

  loadLoggedUserData() async {
    mainMenuState = MainMenuState.empty;
    mainMenuState = MainMenuState.complete;
    notifyListeners();
  }

  setScreenHeight(value) => screenHeight = value;
  setScreenWidth(value) => screenWidth = value;

  List<Apiary>? listaApiariesHome;
  ModelRetornoApiaries? retornoApiaries;

  ModelRetornoFights? retornoFights;
  List<Fight>? listaFightsHome;

  Fight? nextFight;

  getApiariesToHome() async {
    doLoading();
    retornoApiaries = await repository.getApiariesHome();
    listaApiariesHome = retornoApiaries?.body?.apiary?.take(3).toList();
    stopLoading();
    return null;
  }
}
