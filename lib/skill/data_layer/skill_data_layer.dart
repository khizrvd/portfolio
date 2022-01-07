import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/skill/data_layer/models/skill_data_model.dart';

class SkillDataLayer {
  Future<SkillDataModel> getSkillData() async {
    try {
      String response = await rootBundle.loadString('assets/data/skill.json');
      final decoded = jsonDecode(response) as Map<String, dynamic>;

      if (decoded.isEmpty) {
        throw decoded['message'];
      }

      final skillJson = decoded['data'];

      if (skillJson.isEmpty) {
        throw decoded['message'];
      }
      final _skillList = SkillDataModel.fromJson(skillJson);
      return _skillList;
    } catch (e) {
      throw 'Skill Page not found';
    }
  }
}
