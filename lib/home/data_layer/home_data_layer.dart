import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio/home/data_layer/models/home_data_model.dart';

class HomeDataLayer {
  Future<HomeDataModel> getHomeData() async {
    try {
      String response = await rootBundle.loadString('assets/data/home.json');
      final decoded = jsonDecode(response) as Map<String, dynamic>;

      if (decoded.isEmpty) {
        throw decoded['message'];
      }

      final homeJson = decoded['data'];

      if (homeJson.isEmpty) {
        throw decoded['message'];
      }
      final _homeList = HomeDataModel.fromJson(homeJson);
      return _homeList;
    } catch (e) {
      throw 'Home Page not found';
    }
  }
}
