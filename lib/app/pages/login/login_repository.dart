// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:honeybee/app/models/retornologin_model.dart';
import 'package:honeybee/app/models/retornologout_model.dart';
import 'package:honeybee/const/dio.dart';
import 'package:honeybee/const/env.dart';
import 'package:honeybee/shared/prefs.dart';

class LoginRepository {
  //! metodo login
  Future<ModelRetornoLogin?> postLogin(String usuario, String senha) async {
    var headerAuth = Env.api_key;
    var headerApiKey = Env.api_secret;

    var headerParameters = {"x_api_key": headerAuth, "api_key": headerApiKey};

    //! o ideal seria efetuar o login usando senha cifrada...
    var bytesToHash = utf8.encode(senha);
    var senhaCifrada = sha512.convert(bytesToHash);

    // var dataBody = jsonEncode({
    //   "username": usuario.trim().toLowerCase().toString(),
    //   "password": senhaCifrada.toString(),
    // });

    var dataBody = jsonEncode({
      "username": usuario.trim().toLowerCase().toString(),
      "password": senha.trim().toString(),
    });

    try {
      Response response = await dio.post(
        Env.urlBase + Env.methodPostLogin,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        data: dataBody,
      );
      if (response.statusCode == 200) {
        var saida = ModelRetornoLogin.fromJson(response.data);

        await Prefs.setString("token", saida.body!.token.toString());
        await Prefs.setString(
            "loggedUser", jsonEncode(saida.body!.data!.accountData));

        await authDioInstance();

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> getLogout() async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    try {
      Response response = await dio.get(
        Env.urlBase + Env.methodGetLogout,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        // data: dataBody,
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        Prefs.setString("token", "");

        await revokeAuthDioInstance();

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> doAccountCancelation() async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    try {
      Response response = await dio.get(
        Env.urlBase + Env.methodPostAccountCancelation,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        // data: dataBody,
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        Prefs.setString("token", "");

        await revokeAuthDioInstance();

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> doAccountSuspension() async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    try {
      Response response = await dio.get(
        Env.urlBase + Env.methodPostAccountSuspension,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        // data: dataBody,
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        Prefs.setString("token", "");

        await revokeAuthDioInstance();

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> doChangePassword(String? newPassword) async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    var dataBody = {"new_password": newPassword};

    try {
      Response response = await dio.patch(
        Env.urlBase + Env.methodPostAccountSuspension,
        data: dataBody,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        // data: dataBody,
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        Prefs.setString("token", "");

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> doRecoveryPasswordByCode(
      String? recoveryCode, String? emailConfirmation) async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    var dataBody = {
      "email_confirmation": emailConfirmation,
      "recovery_code": recoveryCode
    };

    try {
      Response response = await dio.post(
        Env.urlBase + Env.methodPostPasswordRecoveryByCode,
        data: dataBody,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  //! metodo logout
  Future<ModelRetornoLogout?> doRecoveryCodeGeneration() async {
    var headerAuth = Env.api_key;

    var headerParameters = {
      "x_api_key": headerAuth,
    };

    var auth;

    try {
      Response response = await dio.post(
        Env.urlBase + Env.methodPostRecoveryPassword,
        options: Options(
            headers: headerParameters,
            contentType: 'application/json',
            responseType: ResponseType.json),
        // data: dataBody,
      );
      if (response.data.error.error.statusCode == 200) {
        var saida = ModelRetornoLogout.fromJson(response.data);

        return saida;
      }
    } on DioError catch (exc) {
      if (exc.response?.statusCode?.toInt() != 200) {
        return null;
      }
      //! throw ('Exception ${exc.message}');
    }
    return null;
  }

  Future<void> authDioInstance() async {
    final token = await Prefs.getString('token');

    dio.options.headers = {"Authorization": "Bearer $token"};
  }

  Future<void> revokeAuthDioInstance() async {
    dio.options.headers = {"Authorization": ""};
  }
}
