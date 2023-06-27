import 'package:dio/dio.dart';
import 'package:honeybee/app/models/retornoapiaries_model.dart';

import 'package:honeybee/const/dio.dart';
import 'package:honeybee/const/env.dart';

class HomeRepository {
  Future<ModelRetornoApiaries?> getApiariesHome() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllApiaries,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoApiaries.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }

  Future<ModelRetornoApiaries?> getApiariesPage() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllApiaries,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoApiaries.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }
}
