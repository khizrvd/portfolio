import 'package:equatable/equatable.dart';
import 'package:portfolio/portfolio/repository_layer/models/project_repo_model.dart';

class PortfolioRepoModel extends Equatable {
  const PortfolioRepoModel({required this.projects});

  final List<ProjectRepoModel>? projects;

  @override
  List<Object?> get props => [projects];
}
