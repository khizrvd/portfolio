part of 'skill_bloc.dart';


enum SkillStatus { initial, loading, loaded, error }

class SkillState extends Equatable {
  const SkillState({
    this.skillStatus = SkillStatus.initial,
    this.skillData,
  });
  final SkillStatus skillStatus;
  final SkillRepoModel? skillData;

  SkillState copyWith({
    SkillStatus? skillStatus,
    SkillRepoModel? skillData,
  }) {
    return SkillState(
      skillStatus: skillStatus ?? this.skillStatus,
      skillData: skillData ?? this.skillData,
    );
  }

  @override
  List<Object?> get props => [skillStatus, skillData];
}

