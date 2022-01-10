import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
          case SkillStatus.initial:
            context.read<SkillBloc>().add(
                  SkillDataLoaded(),
                );
            return const _SkillInitial();
          case SkillStatus.loading:
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

class _SkillInitial extends StatelessWidget {
  const _SkillInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Skill Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
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

class _SkillLoaded extends StatefulWidget {
  const _SkillLoaded({Key? key, required this.skillData}) : super(key: key);

  final SkillRepoModel? skillData;

  @override
  State<_SkillLoaded> createState() => _SkillLoadedState();
}

class _SkillLoadedState extends State<_SkillLoaded>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    Timer(
        const Duration(milliseconds: 200), () => animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 65.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Expanded(
            child: AnimationLimiter(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 275,
                    crossAxisSpacing: 30,
                    // mainAxisSpacing: 30,
                  ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 60.0,
                  ),
                  itemCount: widget.skillData?.skills?.length ?? 6,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 750),
                      child: SlideAnimation(
                        horizontalOffset: -50.0,
                        child: FadeInAnimation(
                          child: SkillGrid(
                            skillData: widget.skillData,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  }),
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
