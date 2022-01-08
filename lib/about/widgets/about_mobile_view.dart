import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/about_me.dart';
import 'package:portfolio/about/widgets/skill_grid.dart';
import 'package:portfolio/utils/animation.dart';

class AboutMobileView extends StatelessWidget {
  const AboutMobileView({
    Key? key,
    required this.aboutData,
    required this.animationController,
  }) : super(key: key);

  final AboutRepoModel? aboutData;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 40.0,
        top: 60,
      ),
      child: Column(
        children: [
          Flexible(
            child: CustomAnimation(
              animationController: animationController,
              beginOffset: const Offset(-1, 0),
              endOffset: Offset.zero,
              child: AboutMe(
                aboutData: aboutData,
              ),
            ),
          ),
          CustomAnimation(
            animationController: animationController,
            beginOffset: const Offset(1, 0),
            endOffset: Offset.zero,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/ellipse-3.png',
                  color: const Color(0xff1864D7).withOpacity(0.75),
                  width: 165,
                ),
                SizedBox(
                  width: 250,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: aboutData?.skills?.length ?? 4,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return SkillGrid(
                        aboutData: aboutData,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
