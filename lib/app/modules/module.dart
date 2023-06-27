import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/app/pages/about/about_controller.dart';
import 'package:honeybee/app/pages/help/help_controller.dart';
import 'package:honeybee/app/pages/perfil/perfil_controller.dart';
import 'package:honeybee/app/pages/home/home_controller.dart';
import 'package:honeybee/app/pages/login/login_controller.dart';
import 'package:honeybee/app/pages/splash/splash_controller.dart';
import 'package:honeybee/routes/routes.dart';

class AppModule extends Module {
  Routes myRoutes = Routes();

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => SplashController()),
        Bind.singleton((i) => LoginController()),
        Bind.singleton((i) => HomeController()),
        Bind.singleton((i) => PerfilController()),
        Bind.singleton((i) => AboutController()),
        Bind.singleton((i) => HelpController()),
      ];

  @override
  List<ModularRoute> get routes => [...myRoutes.routes];
}
