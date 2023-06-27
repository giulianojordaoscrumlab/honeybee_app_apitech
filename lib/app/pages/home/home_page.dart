import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/home/home_controller.dart';
import 'package:honeybee/app/widgets/honeybee_bottomnavigator_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/shared/enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  var loggedUser = [];

  @override
  void initState() {
    //controller.doLoading();
    controller.getNextFirstFightToHome();
    controller.getFightsToHome();
    controller.getNewsToHome();
    controller.loadLoggedUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setScreenWidth(MediaQuery.of(context).size.width);
    controller.setScreenHeight(MediaQuery.of(context).size.height);

    if (controller.drawerData == null ||
        controller.drawerState != DrawerState.initialized) {
      controller.getDrawerStrucuture(context);
    }

    controller.setSelectedBottomNavigatorIndex(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/icons/launcher_icon.png",
                width: 32,
              ),
              Text(
                "HoneyBee",
                style: HoneyBeeText.h4.copyWith(
                  color: AppColors.blackTitle,
                ),
              ),
            ]),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      bottomNavigationBar: HoneyBeeBottomNavigationBar(
        selectedIndex: controller.selectedBottomNavigatorIndex,
      ),
      body: Center(
        child: Text(
          "Em desenvolvimento",
          style: HoneyBeeText.h2.copyWith(color: AppColors.blackTitle),
        ),
      ),
    );
  }

  showDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
