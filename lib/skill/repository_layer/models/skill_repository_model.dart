import 'package:equatable/equatable.dart';

class SkillRepoModel extends Equatable {
  const SkillRepoModel({required this.skills});

  final List? skills;

  Map<String, dynamic> toJson() {
    return {
      'skills': skills,
    };
  }

  factory SkillRepoModel.fromJson(Map<String, dynamic> map) {
    return SkillRepoModel(
      skills: map['skills'],
    );
  }

  @override
  List<Object?> get props => [skills];
}