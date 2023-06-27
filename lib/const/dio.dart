import 'package:dio/dio.dart';
import 'package:honeybee/const/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final options = BaseOptions(
  baseUrl: Env.urlBase + '/api/v1',
  validateStatus: (value) {
    // if (value == 401) {
    //   ControllerLogin().logOut();
    // Modular.to.navigate(NamedRoutes.HOME);
    // Modular.to.navigate(NamedRoutes.WELCOME);
    //   Custom401Dialog.show();
    // }
    return value! < 300;
  },
);

Dio dio = Dio(options)
  ..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
      error: true,
    ),
  );
