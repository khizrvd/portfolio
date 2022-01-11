import 'package:equatable/equatable.dart';
import 'package:portfolio/portfolio/data_layer/models/project_data_model.dart';

class PortfolioDataModel extends Equatable {
  const PortfolioDataModel({required this.projects});

  final List<ProjectDataModel>? projects;

  factory PortfolioDataModel.fromJson(Map<String, dynamic> map) {
    return PortfolioDataModel(
        projects: (map['projects'] as List)
            .map((e) => ProjectDataModel.fromJson(e))
            .toList());
  }

  @override
  List<Object?> get props => [projects];
}
