import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/help/help_controller.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  var controller = HelpController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
