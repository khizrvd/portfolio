import 'package:portfolio/about/data_layer/about_data_layer.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';

class AboutRepoLayer {
  AboutRepoLayer(this._aboutDataLayer);

  final AboutDataLayer _aboutDataLayer;

  Future<AboutRepoModel> getHomeData() async {
    var _aboutData = await _aboutDataLayer.getAboutData();
    return AboutRepoModel(
      name: _aboutData.name,
      qualification: _aboutData.qualification,
      location: _aboutData.location,
      description: _aboutData.description,
      hobbies: _aboutData.hobbies,
      skills: _aboutData.skills,
    );
  }
}
