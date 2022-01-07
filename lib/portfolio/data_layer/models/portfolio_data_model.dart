import 'package:equatable/equatable.dart';

class PortfolioDataModel extends Equatable {
  const PortfolioDataModel({required this.projects});

  final List projects;

  Map<String, dynamic> toJson() {
    return {
      'projects': projects,
    };
  }

  factory PortfolioDataModel.fromJson(Map<String, dynamic> map) {
    return PortfolioDataModel(
      projects: map['projects'],
    );
  }

  @override
  List<Object?> get props => [projects];
}
