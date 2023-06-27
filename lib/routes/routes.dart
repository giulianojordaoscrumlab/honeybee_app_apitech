// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/about/about_page.dart';
import 'package:honeybee/app/pages/help/help_page.dart';
import 'package:honeybee/app/pages/login/logout_page.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_page.dart';
import 'package:honeybee/app/pages/perfil/perfil_page.dart';
import 'package:honeybee/app/pages/home/home_page.dart';
import 'package:honeybee/app/pages/login/login_page.dart';
import 'package:honeybee/app/pages/splash/splash_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  final List<ChildRoute> routes = [
    ChildRoute(
      NamedRoutes.SPLASH,
      child: (_, __) => const SplashPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.LOGIN,
      child: (_, __) => const LoginPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.FORGOTPASSWORD,
      child: (_, __) => const RecoveryPasswordPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.HOME,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.BEES,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.APIARIES,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.HIVES,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.JOURNALS,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.PROFILE,
      child: (_, __) => const PerfilPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.HELP,
      child: (_, __) => const HelpPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.HELP,
      child: (_, __) => const HelpPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.ABOUT,
      child: (_, __) => const AboutPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.EXIT,
      child: (context, args) => const LogoutPage(),
      transition: TransitionType.fadeIn,
    ),
  ];

  callExit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }
}

class NamedRoutes {
  //! Splash
  static const SPLASH = "/splash";
  //! Login
  static const LOGIN = "/login";
  //! Home
  static const HOME = "/home";

  static const HIVES = "/hives";
  static const APIARIES = "/apiaries";
  static const JOURNALS = "/journals";
  static const BEES = "/bees";

  //! Passord Reset
  static const FORGOTPASSWORD = "/forgotpassword";
  static const NEWPASSWORD = "/newpassword";

  //! Videoplayer
  static const SLYTVIDEOPLAYER = '/videoplayer';
  //! Criacao de usuario
  static const CREATEUSER = "/createuser";
  static const CREATEACCOUNTPRIVACYPOLICY = "/createuser/privacypolicy";
  static const CREATEACCOUNTUSETERMS = "/createuser/useterms";
  static const CREATEACCOUNTCHOOSEPLAN = "/createuser/chooseplan";
  static const CREATEACCOUNTFOLLOWFIGHTERS = "/createuser/followfighters";
  static const CREATEUSERADDENDERECO = "/createuser/addendereco";
  //! Configs e Editors
  static const CONFIGS = '/configs';
  static const EDITUSER = '/edituser';
  //! Terms Politics and Credits
  static const POLITICSPRIVACY = '/potiticsprivacy';
  static const CREDITS = '/credits';
  static const TERMS = '/terms';
  static const POLITICSPRIVACYCONFIGS = '/potiticsprivacyconfigs';
  //! Lutas
  static const FIGHTS = "/lutas";
  static const FIGHTSDETAIL = "/lutasdetalhes";
  static const FIGHTSSTATS = "/lutasestatisticas";
  //! JungleVerso
  static const JUNGLEVERSE = "/jungleverse";
  //! Lutadores
  static const FIGHTERSDETAILS = "/lutadoresdetalhes";
  static const FIGHTERS = "/lutadores";
  //! Lutadores V2
  static const FIGHTERSV2 = "/lutadoresv2";
  static const FIGHTERSV2DETAILS = "/lutadoresv2detalhes";
  //! Noticias
  static const NEWS = "/noticias";
  static const NEWSDETAILS = "/noticiasdetalhes";

  //! PENDENTES
  static const ABOUT = "/sobre";
  static const PROFILE = "/profile";
  static const HELP = "/ajuda";
  static const VIDEOS = "/videos";
  static const EXIT = "/sair";

  static const PRIVACYSTATIC = "/privacyStatic";
  static const TERMSSTATIC = "/termsStatic";

  static const CONFIRMACCOUNTSUSPENSION = "/confirmSuspension";
  static const CONFIRMACCOUNTCANCELATION = "/confirmCancelation";

  static const PASSWORDCHANGE = "/passwordChange";
  static const PASSWORDRECOVERY = "/passwordRecovery";
  static const PASSWORDRECOVERYBYCODE = "/passwordRecoveryByCode";
}
