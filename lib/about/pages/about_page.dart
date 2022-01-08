import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/about/bloc/about_bloc.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/about_mobile_view.dart';
import 'package:portfolio/about/widgets/about_web_view.dart';
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
    return size.width > mobile
        ? AboutWebView(
            aboutData: widget.aboutData,
            animationController: animationController,
          )
        : AboutMobileView(
            aboutData: widget.aboutData,
            animationController: animationController,
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
