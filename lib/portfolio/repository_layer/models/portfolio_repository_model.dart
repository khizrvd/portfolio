import 'package:equatable/equatable.dart';

class PortfolioRepoModel extends Equatable {
  const PortfolioRepoModel({required this.projects});

  final List projects;

  Map<String, dynamic> toJson() {
    return {
      'projects': projects,
    };
  }

  factory PortfolioRepoModel.fromJson(Map<String, dynamic> map) {
    return PortfolioRepoModel(
      projects: map['projects'],
    );
  }

  @override
  List<Object?> get props => [projects];
}