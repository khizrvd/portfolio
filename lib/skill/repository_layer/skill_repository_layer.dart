import 'package:portfolio/skill/data_layer/skill_data_layer.dart';
import 'package:portfolio/skill/repository_layer/models/skill_repository_model.dart';

class SkillRepoLayer {
  SkillRepoLayer(this._skillDataLayer);

  final SkillDataLayer _skillDataLayer;

  Future<SkillRepoModel> getSkillData() async {
    var _skillData = await _skillDataLayer.getSkillData();
    return SkillRepoModel(skills: _skillData.skills);
  }
}
