import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:honeybee/app/models/drawer_model.dart';
import 'package:honeybee/app/models/mainmenu_model.dart';
import 'package:honeybee/app/models/retorno_ytsl_videos_model.dart';
import 'package:honeybee/app/models/retornofighters_model.dart';
import 'package:honeybee/app/models/retornofightfilter_model.dart';
import 'package:honeybee/app/models/retornofights_model.dart';
import 'package:honeybee/app/models/retornonews_model.dart';
import 'package:honeybee/const/dio.dart';
import 'package:honeybee/const/env.dart';

class HomeRepository {
  Future<ModelMainMenu?> getMainMenuStructure(
      bool mocked, BuildContext context) async {
    if (mocked == true) {
      var result = await DefaultAssetBundle.of(context)
          .loadString("assets/data/mainmenu_mocked.json");
      var saida = ModelMainMenu.fromJson(jsonDecode(result));
      return saida;
    } else {
      //! Implementar a leitura vindo da API... pode ser pelo users...
      //  com base nas permissoes mas isso somente depois do MVP
    }

    return null;
  }

  Future<ModelDrawer?> getDrawerStructure(
      bool mocked, BuildContext context) async {
    if (mocked == true) {
      var result = await DefaultAssetBundle.of(context)
          .loadString("assets/data/drawer_mocked.json");
      var saida = ModelDrawer.fromJson(jsonDecode(result));
      return saida;
    } else {
      //! Implementar a leitura vindo da API... pode ser pelo users...
      //  com base nas permissoes mas isso somente depois do MVP
    }

    return null;
  }

  Future<ModelRetornoNews?> getNewsHome() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllNews,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoNews.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }

  Future<ModelRetornoNews?> getNewsPage() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllNews,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoNews.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }

  Future<List<ModelRetornoVideos>?> getVideosPage() async {
    var dataBody = {
      "channel": "UC5M5y5qpJRvaLnAIRVzGqoA",
      "kind": "video",
      "numitems": 2000
    };

    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllVideos,
      data: dataBody,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = (result.data as List)
        .map((item) => ModelRetornoVideos.fromJson(item))
        .toList();

    return saida;
  }

  Future<ModelRetornoFights?> getFightsHome() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllFights,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoFights.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }

  Future<ModelRetornoFighters?> getFightersPage() async {
    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchAllFighters,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
    var saida = ModelRetornoFighters.fromJson(result.data);

    if (saida.error?.statusCode == 200) {
      return saida;
    }

    return null;
  }

  Future<FilteredFight?> getNextFight() async {
    DateTime nowDate = DateTime.now();

    Map<String, dynamic> filter = {
      'eventDate': {"\$gte": nowDate.toIso8601String()}
    };

    var result = await dio.post(
      Env.urlBase + Env.methodPostFetchNextFight,
      options: Options(
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
      data: json.encode(filter),
    );
    var saida = ModelRetornoFightsFilter.fromJson(result.data);

    var filteredFight = saida.body?.fight;

    if (saida.error?.statusCode == 200) {
      return filteredFight;
    }

    return null;
  }
}
