import 'package:portfolio/portfolio/data_layer/portfolio_data_layer.dart';
import 'package:portfolio/portfolio/repository_layer/models/portfolio_repository_model.dart';

class PortfolioRepoLayer {
  PortfolioRepoLayer(this._portfolioDataLayer);

  final PortfolioDataLayer _portfolioDataLayer;

  Future<PortfolioRepoModel> getPortfolioData() async {
    var _portfolioData = await _portfolioDataLayer.getPortfolioData();
    return PortfolioRepoModel(projects: _portfolioData.projects);
  }
}
