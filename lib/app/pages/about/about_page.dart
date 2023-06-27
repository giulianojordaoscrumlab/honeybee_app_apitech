import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/about/about_controller.dart';
import 'package:honeybee/const/colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var controller = AboutController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setScreenWidth(MediaQuery.of(context).size.width);
    controller.setScreenHeight(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: AppColors.pageMainBackground,
      body: Container(),
    );
  }
}
