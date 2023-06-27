import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/home/home_controller.dart';
import 'package:honeybee/app/widgets/honeybee_button_widget.dart';
import 'package:honeybee/app/widgets/honeybee_degradee_horizontal_line_separator.dart';
import 'package:honeybee/app/widgets/honeybee_textfield_widget.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/icons/icons_package_honeybee.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _HomePageState();
}

class _HomePageState extends State<PerfilPage> {
  var controller = HomeController();

  var loggedUser = [];

  @override
  void initState() {
    controller.loadLoggedUserData();
    controller.getLoggedUserFromPrefs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setScreenWidth(MediaQuery.of(context).size.width);
    controller.setScreenHeight(MediaQuery.of(context).size.height);

    List<Widget> actions = [
      Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
          bottom: 3.0,
          top: 3.0,
        ),
        child: IconButton(
            icon: const Icon(HoneyBeeIcons.close,
                size: 32, color: AppColors.primary4),
            onPressed: () => Modular.to.pushNamed(NamedRoutes.HOME)),
      ),
    ];

    controller.setSelectedBottomNavigatorIndex(0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      // bottomNavigationBar: HoneyBeeBottomNavigationBar(
      //   selectedIndex: controller.selectedBottomNavigatorIndex,
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        primary: true,
        iconTheme: const IconThemeData(size: 32, color: AppColors.primary4),
        title: const Text(
          'Perfil',
          style: TextStyle(fontSize: 20, color: AppColors.primary4),
        ),
        actions: actions,
      ),
      drawer: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Drawer(
          elevation: 0,
          backgroundColor: AppColors.primary2,
          width: controller.screenWidth * 0.7,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 19,
              ),
              Container(
                alignment: Alignment.center,
                width: controller.screenWidth,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Image.asset(
                  "assets/images/honeybee_logo.png",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              (controller.listaDrawerItems != null)
                  ? Column(children: controller.listaDrawerItems!)
                  : Container(),
            ],
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      "assets/images/icons/botoes/profile.png",
                      fit: BoxFit.cover,
                      color: AppColors.moduleButtonLabelColor,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Meus dados",
                style: HoneyBeeText.h3.copyWith(
                  color: AppColors.moduleButtonLabelColor,
                ),
              ),
              const HoneyBeeHorizontalLineSeparator(),
              const SizedBox(
                height: 20,
              ),
              HoneyBeeTextField(
                enabledBorderColor: AppColors.primary4,
                backgroundColor: AppColors.background,
                focusBorderColor: AppColors.primary3,
                errorBorderColor: AppColors.onError,
                disabledBorderColor: AppColors.primary2,
                enabled: false,
                fillColor: AppColors.primary2,
                filled: true,
                labelColor: AppColors.moduleButtonLabelColor,
                colorText: AppColors.moduleButtonLabelColor,
                labelText: "Nome Completo",
                focusNode: FocusNode(),
                controller: TextEditingController(
                  text:
                      controller.retornoLogin?.body?.data?.fullname.toString(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HoneyBeeTextField(
                enabledBorderColor: AppColors.primary4,
                backgroundColor: AppColors.background,
                focusBorderColor: AppColors.primary3,
                errorBorderColor: AppColors.onError,
                disabledBorderColor: AppColors.primary2,
                enabled: false,
                fillColor: AppColors.primary2,
                filled: true,
                labelColor: AppColors.moduleButtonLabelColor,
                labelText: "E-mail",
                focusNode: FocusNode(),
                colorText: AppColors.moduleButtonLabelColor,
                controller: TextEditingController(
                  text: controller
                      .retornoLogin?.body?.data?.accountData?.userName
                      .toString(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "De acordo com a legislação sobre a proteção de dados e sigilo das informações você pode solicitar a 'suspensão' ou o 'cancelamento' de sua conta. No caso de cancelamento todos os seus dados serão removidos de nossa base de dados de forma não efêmera.",
                style: HoneyBeeText.h5.copyWith(
                  color: AppColors.moduleButtonLabelColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: HoneyBeeButton(
                  child: Text(
                    "Trocar senha",
                    style: HoneyBeeText.buttonLabel.copyWith(
                      color: AppColors.moduleButtonLabelColor,
                    ),
                  ),
                  background: AppColors.primary1,
                  onPressed: () =>
                      Modular.to.pushNamed(NamedRoutes.PASSWORDCHANGE),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: HoneyBeeButton(
                  child: const Text("Suspender minha conta"),
                  background: const Color(0xFFAA6C39),
                  onPressed: () => Modular.to
                      .pushNamed(NamedRoutes.CONFIRMACCOUNTSUSPENSION),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: HoneyBeeButton(
                  child: const Text("Cancelar minha conta"),
                  background: const Color(0xFF226666),
                  onPressed: () => Modular.to
                      .pushNamed(NamedRoutes.CONFIRMACCOUNTCANCELATION),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
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
