import 'package:portfolio/home/data_layer/home_data_layer.dart';
import 'package:portfolio/home/repository_layer/models/home_repository_model.dart';

class HomeRepoLayer {
  HomeRepoLayer(this._homeDataLayer);

  final HomeDataLayer _homeDataLayer;

  Future<HomeRepoModel> getHomeData() async {
    var _homeData = await _homeDataLayer.getHomeData();
    return HomeRepoModel(
      name: _homeData.name,
      qualification: _homeData.qualification,
      location: _homeData.location,
    );
  }
}
