import 'package:flutter/material.dart';
import 'package:honeybee/app/pages/login/recovery_password/recovery_password_controller.dart';
import 'package:honeybee/app/pages/login/recovery_password/widgets/recovery_pass_code.dart';
import 'package:honeybee/app/pages/login/recovery_password/widgets/recovery_pass_email.dart';
import 'package:honeybee/app/pages/login/recovery_password/widgets/recovery_pass_newpass.dart';
import 'package:honeybee/app/widgets/honeybee_button_widget.dart';
import 'package:animations/animations.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/enums.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final RecoveryPasswordController _controller = RecoveryPasswordController();

  List<Widget> body = const <Widget>[
    RecoveryPassEmail(),
    RecoveryPassCode(),
    RecoveryPassNewPassword()
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => PageTransitionSwitcher(
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) =>
                          SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
                  child: body.elementAt(_controller.recoveryStage),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 1 - 40,
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return HoneyBeeButton(
                        onPressed: () async => _formKey.currentState!.validate()
                            ? await _controller.buttonActions(context)
                            : null,
                        background:
                            _controller.recoveryState == ModelStates.idle
                                ? null
                                : AppColors.surfaceVariant,
                        child: (_controller.recoveryState == ModelStates.idle)
                            ? Text(_controller.buttonText)
                            : const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
