import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/skill/repository_layer/models/skill_repository_model.dart';
import 'package:portfolio/skill/widgets/skill_grid_item.dart';

class SkillGrid extends StatelessWidget {
  const SkillGrid({Key? key, required this.skillData}) : super(key: key);

  final SkillRepoModel? skillData;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 425,
            mainAxisExtent: 275,
            crossAxisSpacing: 30,
            // mainAxisSpacing: 30,
          ),
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: 40,
            left: 60.0,
            right: 60.0,
            bottom: 20,
          ),
          itemCount: skillData?.skills?.length ?? 6,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 750),
              child: SlideAnimation(
                horizontalOffset: -50.0,
                child: FadeInAnimation(
                  child: SkillGridItem(
                    skillData: skillData,
                    index: index,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
