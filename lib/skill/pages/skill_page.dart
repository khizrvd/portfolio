import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/skill/bloc/skill_bloc.dart';
import 'package:portfolio/skill/repository_layer/models/skill_repository_model.dart';
import 'package:portfolio/skill/widgets/skill_grid.dart';
import 'package:portfolio/utils/constants.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillBloc, SkillState>(
      builder: (context, state) {
        switch (state.skillStatus) {
          case SkillStatus.loading:
            context.read<SkillBloc>().add(
                  SkillDataLoaded(),
                );
            return const _SkillLoading();
          case SkillStatus.loaded:
            return _SkillLoaded(
              skillData: state.skillData,
            );
          case SkillStatus.error:
          default:
            return const _SkillError();
        }
      },
    );
  }
}

class _SkillLoading extends StatelessWidget {
  const _SkillLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SkillLoaded extends StatelessWidget {
  const _SkillLoaded({Key? key, required this.skillData}) : super(key: key);

  final SkillRepoModel? skillData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65),
      child: CustomScrollView(
        primary: false,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'WHAT I DO',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Specializing In',
                  style: TextStyle(
                    fontSize: 30,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SkillGrid(
              skillData: skillData,
            ),
          )
        ],
      ),
    );
  }
}

class _SkillError extends StatelessWidget {
  const _SkillError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something Went Wrong!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
