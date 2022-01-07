import 'package:equatable/equatable.dart';

class SkillDataModel extends Equatable {
  const SkillDataModel({required this.skills});

  final List skills;

  Map<String, dynamic> toJson() {
    return {
      'skills': skills,
    };
  }

  factory SkillDataModel.fromJson(Map<String, dynamic> map) {
    return SkillDataModel(
      skills: map['skills'],
    );
  }

  @override
  List<Object?> get props => [skills];
}
