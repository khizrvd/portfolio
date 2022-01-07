import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/portfolio/data_layer/models/portfolio_data_model.dart';

class PortfolioDataLayer {
  Future<PortfolioDataModel> getPortfolioData() async {
    try {
      String response = await rootBundle.loadString('assets/data/portfolio.json');
      final decoded = jsonDecode(response) as Map<String, dynamic>;

      if (decoded.isEmpty) {
        throw decoded['message'];
      }

      final portfolioJson = decoded['data'];

      if (portfolioJson.isEmpty) {
        throw decoded['message'];
      }
      final _portfolioList = PortfolioDataModel.fromJson(portfolioJson);
      return _portfolioList;
    } catch (e) {
      throw 'Portfolio Page not found';
    }
  }
}
