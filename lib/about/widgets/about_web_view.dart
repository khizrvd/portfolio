import 'package:flutter/material.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/about_me.dart';
import 'package:portfolio/about/widgets/skill_grid.dart';
import 'package:portfolio/utils/animation.dart';
import 'package:portfolio/utils/constants.dart';

class AboutWebView extends StatelessWidget {
  const AboutWebView({ Key? key, required this.aboutData, required this.animationController }) : super(key: key);

  final AboutRepoModel? aboutData;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomAnimation(
          animationController: animationController,
          beginOffset: const Offset(-1, 0),
          endOffset: Offset.zero,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                  top: 45,
                ),
                child: Image.asset(
                  'assets/images/ellipse-3.png',
                  color: const Color(0xff1864D7).withOpacity(0.75),
                  width: 240,
                ),
              ),
              SizedBox(
                width: 360,
                child: GridView.builder(
                  itemCount: aboutData?.skills?.length ?? 4,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
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
        size.width > tablet
            ? CustomAnimation(
                animationController: animationController,
                beginOffset: const Offset(0, 1),
                endOffset: Offset.zero,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Image.asset(
                    'assets/images/boy.png',
                    width: 325,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: 25.0,
                  top: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomAnimation(
                        animationController: animationController,
                        beginOffset: const Offset(0, -1),
                        endOffset: Offset.zero,
                        child: AboutMe(
                          aboutData: aboutData,
                        ),
                      ),
                    ),
                    CustomAnimation(
                      animationController: animationController,
                      beginOffset: const Offset(0, 1),
                      endOffset: Offset.zero,
                      child: Image.asset(
                        'assets/images/boy.png',
                        width: 225,
                      ),
                    ),
                  ],
                ),
              ),
        size.width > tablet
            ? CustomAnimation(
                animationController: animationController,
                beginOffset: const Offset(1, 0),
                endOffset: Offset.zero,
                child: AboutMe(
                  aboutData: aboutData,
                ),
              )
            : Container(),
      ],
    );
  }
}