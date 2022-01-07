import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/skill/repository_layer/models/skill_repository_model.dart';
import 'package:portfolio/skill/repository_layer/skill_repository_layer.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  final SkillRepoLayer skillRepository;
  SkillBloc(this.skillRepository) : super(const SkillState()) {
    on<SkillDataLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            skillStatus: SkillStatus.loading,
          ),
        );
        final _skillData = await skillRepository.getSkillData();
        emit(
          state.copyWith(
            skillStatus: SkillStatus.loaded,
            skillData: _skillData,
          ),
        );
      },
    );
  }
}
