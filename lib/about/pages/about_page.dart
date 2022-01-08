import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/about/bloc/about_bloc.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/about_me.dart';
import 'package:portfolio/about/widgets/skill_grid.dart';
import 'package:portfolio/utils/animation.dart';
import 'package:portfolio/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(
      builder: (context, state) {
        switch (state.aboutStatus) {
          case AboutStatus.initial:
            context.read<AboutBloc>().add(
                  AboutDataLoaded(),
                );
            return const _AboutInitial();
          case AboutStatus.loading:
            return const _AboutLoading();
          case AboutStatus.loaded:
            return _AboutLoaded(
              aboutData: state.aboutData,
            );
          case AboutStatus.error:
          default:
            return const _AboutError();
        }
      },
    );
  }
}

class _AboutInitial extends StatelessWidget {
  const _AboutInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'About Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _AboutLoaded extends StatefulWidget {
  const _AboutLoaded({Key? key, required this.aboutData}) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  State<_AboutLoaded> createState() => _AboutLoadedState();
}

class _AboutLoadedState extends State<_AboutLoaded>
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
                  itemCount: widget.aboutData?.skills?.length ?? 4,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                  ),
                  itemBuilder: (context, index) {
                    return SkillGrid(
                      aboutData: widget.aboutData,
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
                          aboutData: widget.aboutData,
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
                  aboutData: widget.aboutData,
                ),
              )
            : Container(),
      ],
    );
  }
}

class _AboutLoading extends StatelessWidget {
  const _AboutLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _AboutError extends StatelessWidget {
  const _AboutError({Key? key}) : super(key: key);

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
