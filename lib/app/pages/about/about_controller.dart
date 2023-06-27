import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/about/about_repository.dart';

class AboutController extends ChangeNotifier {
  final repository = AboutRepository();

  double screenHeight = 0;
  double screenWidth = 0;

  setScreenHeight(value) => screenHeight = value;
  setScreenWidth(value) => screenWidth = value;
}
