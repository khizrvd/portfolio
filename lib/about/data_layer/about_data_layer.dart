import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio/about/data_layer/models/about_data_model.dart';

class AboutDataLayer {
  Future<AboutDataModel> getAboutData() async {
    try {
      String response = await rootBundle.loadString('assets/data/about.json');
      final decoded = jsonDecode(response) as Map<String, dynamic>;

      if (decoded.isEmpty) {
        throw decoded['message'];
      }

      final aboutJson = decoded['data'];

      if (aboutJson.isEmpty) {
        throw decoded['message'];
      }
      final _aboutList = AboutDataModel.fromJson(aboutJson);
      return _aboutList;
    } catch (e) {
      throw 'About Page not found';
    }
  }
}