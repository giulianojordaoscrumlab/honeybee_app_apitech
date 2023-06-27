// ignore_for_file: unused_element, unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/login/login_controller.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';
import 'package:honeybee/routes/routes.dart';
import 'package:honeybee/shared/prefs.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  VideoPlayerController? videoController;
  bool _visible = false;
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // _loginController.getLoggedUser();

    // videoController?.initialize().then((_) {
    //   videoController?.setLooping(false);
    //   Timer(
    //     const Duration(milliseconds: 400),
    //     () {
    //       setState(() {
    //         videoController?.play();
    //         _visible = true;
    //       });
    //     },
    //   );
    // });

    initSplash();

    videoController =
        VideoPlayerController.asset("assets/videos/splashvideo1.mp4");

    super.initState();
  }

  @override
  void dispose() {
    if (videoController != null) {
      videoController?.dispose();
      videoController = null;
    }
    super.dispose();
  }

  double preloadSimulator = 0.0;

  simulateLoader() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (mounted) {
        try {
          setState(() {
            if (preloadSimulator == 1) {
              timer.cancel();
            } else {
              preloadSimulator = preloadSimulator + 0.01;
            }
          });
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    });
  }

  initSplash() async {
    String userData = await Prefs.getString('loggedUser');
    //!
    // if (userData.isNotEmpty) {
    //   _loginController.getLoggedUser();
    // } else {
    //   videoController?.initialize().then((_) {
    //     videoController?.setLooping(false);
    //     Timer(
    //       const Duration(milliseconds: 400),
    //       () {
    //         setState(() {
    //           videoController?.play();
    //           _visible = true;
    //         });
    //       },
    //     );
    //   });
    //   Future.delayed(const Duration(seconds: 16)).then(
    //     (value) => Modular.to.navigate(NamedRoutes.LOGIN),
    //   );
    // }

    _loginController.getPreviousLogin();
    if (_loginController.previousLogin == false) {
      videoController?.initialize().then((_) {
        videoController?.setLooping(false);
        Timer(
          const Duration(milliseconds: 400),
          () {
            setState(() {
              videoController?.play();
              _visible = true;
            });
          },
        );
      });
      Future.delayed(const Duration(seconds: 11)).then(
        (value) => Modular.to.navigate(NamedRoutes.LOGIN),
      );
    } else {
      Modular.to.navigate(NamedRoutes.LOGIN);
    }
  }

  recoveryAccess() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userData = await Prefs.getString('loggedUser');
    // if (preferences.getBool("accessed") == true) {
    //   Modular.to.navigate(NamedRoutes.HOME);
    // }
    if (userData.isNotEmpty) {
      Modular.to.navigate(NamedRoutes.LOGIN);
    }
    // } else {
    //   Modular.to.navigate(NamedRoutes.LOGIN);
    // }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(
        videoController!,
      ),
    );
  }

  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
        );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = 16;

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 32,
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              child: InkWell(
                onTap: () => skipVideoPlayer(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      size: 24,
                      Icons.skip_next_rounded,
                      color: AppColors.primary4.withOpacity(0.5),
                    ),
                    Text(
                      "PULAR O VÍDEO",
                      style: HoneyBeeText.h6.copyWith(
                        color: AppColors.formFieldTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  skipVideoPlayer() {
    try {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
        videoController!.value = VideoPlayerValue(
          duration: const Duration(
            seconds: 0,
          ),
        );
      }

      Modular.to.navigate(NamedRoutes.LOGIN);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
