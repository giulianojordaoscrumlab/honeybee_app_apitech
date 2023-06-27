import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/home/home_controller.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/routes/routes.dart';

class HoneyBeeBottomNavigationBar extends StatefulWidget {
  const HoneyBeeBottomNavigationBar({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<HoneyBeeBottomNavigationBar> createState() =>
      _HoneyBeeBottomNavigationBarState();
}

class _HoneyBeeBottomNavigationBarState
    extends State<HoneyBeeBottomNavigationBar> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: true,
      onTap: (value) {
        switch (value) {
          case 0:
            Modular.to.pushNamed(NamedRoutes.HOME);
            break;
          case 1:
            Modular.to.pushNamed(NamedRoutes.FIGHTS);
            break;
          case 2:
            Modular.to.pushNamed(NamedRoutes.FIGHTERS);
            break;
          case 3:
            Modular.to.pushNamed(NamedRoutes.NEWS);
            break;
          case 4:
            Modular.to.pushNamed(NamedRoutes.JUNGLEVERSE);
            break;
        }
        homeController.setSelectedBottomNavigatorIndex(value);
      },
      currentIndex: widget.selectedIndex,
      elevation: 0,
      iconSize: 24,
      selectedItemColor: AppColors.primary1,
      unselectedItemColor: AppColors.primary4,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppColors.blackTitle),
          activeIcon: Icon(Icons.home, color: AppColors.whiteTitle),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beenhere_rounded, color: AppColors.blackTitle),
          activeIcon: Icon(Icons.beenhere_rounded, color: AppColors.whiteTitle),
          label: "Apiários",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, color: AppColors.blackTitle),
          activeIcon: Icon(Icons.bookmark, color: AppColors.whiteTitle),
          label: "Colméias",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined, color: AppColors.blackTitle),
          activeIcon:
              Icon(Icons.menu_book_outlined, color: AppColors.whiteTitle),
          label: "Diários",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: AppColors.blackTitle),
          activeIcon: Icon(Icons.history, color: AppColors.whiteTitle),
          label: "Histórico",
        ),
      ],
    );
  }
}
