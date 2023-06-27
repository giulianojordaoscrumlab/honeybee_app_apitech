import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/home/home_controller.dart';
import 'package:honeybee/app/widgets/honeybee_bottomnavigator_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

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
    controller.getApiariesToHome();
    controller.loadLoggedUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setScreenWidth(MediaQuery.of(context).size.width);
    controller.setScreenHeight(MediaQuery.of(context).size.height);

    controller.setSelectedBottomNavigatorIndex(0);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/icons/launcher_icon.png",
            color: AppColors.whiteTitle),
        foregroundColor: AppColors.whiteTitle,
        toolbarHeight: 45,
        backgroundColor: AppColors.primary,
        title: const Text(
          "HoneyBee - APITECH",
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const HoneyBeeBottomNavHive(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apiários",
                        style: HoneyBeeText.h2
                            .copyWith(color: AppColors.moduleButtonLabelColor),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  controller.listaApiariesHome?.length ?? 0,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () => Modular.to
                                        .navigate(NamedRoutes.APIARIES),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 10,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.moduleButtonColor,
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 70,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/icons/botoes/apiary.png",
                                            height: 60,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Text(
                                            controller.listaApiariesHome
                                                    ?.elementAt(index)
                                                    .name ??
                                                "Sem nome",
                                            overflow: TextOverflow.ellipsis,
                                            style: HoneyBeeText.h4.copyWith(
                                                color: AppColors
                                                    .moduleButtonLabelColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Colméias",
                        style: HoneyBeeText.h2
                            .copyWith(color: AppColors.moduleButtonLabelColor),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: () =>
                                  Modular.to.navigate(NamedRoutes.HIVES),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.moduleButtonColor,
                                ),
                                width: MediaQuery.of(context).size.width / 4,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 70,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/icons/botoes/hive.png",
                                      height: 60,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    Text(
                                      "Colméia 1",
                                      style: HoneyBeeText.h4.copyWith(
                                          color:
                                              AppColors.moduleButtonLabelColor),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
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
