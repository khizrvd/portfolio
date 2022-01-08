import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/home/bloc/home_bloc.dart';
import 'package:portfolio/home/repository_layer/models/home_repository_model.dart';
import 'package:portfolio/home/widgets/credits_mobile_view.dart';
import 'package:portfolio/home/widgets/credits_web_view.dart';
import 'package:portfolio/home/widgets/wave_clipper.dart';
import 'package:portfolio/utils/animation.dart';
import 'package:portfolio/utils/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner(
      {Key? key, required this.controller, required this.animationController})
      : super(key: key);
  final PageController controller;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.homeStatus) {
          case HomeStatus.initial:
            context.read<HomeBloc>().add(
                  HomeDataLoaded(),
                );
            return const _HomeInitial();
          case HomeStatus.loading:
            return const _HomeLoading();
          case HomeStatus.loaded:
            return _HomeLoaded(
              homeData: state.homeData,
              animationController: animationController,
            );
          case HomeStatus.error:
          default:
            return const _HomeError();
        }
      },
    );
  }
}

class _HomeInitial extends StatelessWidget {
  const _HomeInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _HomeLoading extends StatelessWidget {
  const _HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _HomeLoaded extends StatelessWidget {
  const _HomeLoaded(
      {Key? key, required this.homeData, required this.animationController})
      : super(key: key);

  final HomeRepoModel? homeData;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            height: mHeight,
            decoration: backgroundGradient,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/ellipse.png',
            color: const Color(0xff91A4AE).withOpacity(0.2),
            width: mWidth * 0.32,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/images/ellipse-2.png',
            color: const Color(0xff91A4AE).withOpacity(0.15),
            width: mWidth * 0.22,
          ),
        ),
        size.width > mobile
            ? Positioned(
                left: mWidth * 0.05,
                child: CreditsWebView(
                  animationController: animationController,
                  name: "HELLO I'M ${homeData!.name.toUpperCase()}",
                  qualification:
                      homeData?.qualification.toString().toUpperCase(),
                  location: homeData?.location.toString(),
                ),
              )
            : Positioned(
                top: 55,
                child: CreditsMobileView(
                  animationController: animationController,
                  name: "HELLO I'M ${homeData!.name.toUpperCase()}",
                  qualification:
                      homeData?.qualification.toString().toUpperCase(),
                  location: homeData?.location.toString(),
                ),
              ),
        Positioned(
          bottom: 5,
          right: mWidth * 0.05,
          child: size.width > mobile
              ? CustomAnimation(
                animationController: animationController,
                beginOffset: const Offset(1, 0),
                endOffset: Offset.zero,
                child: Image.asset(
                  "assets/images/hero-img.png",
                  width: size.width > tablet ? 500 : 400,
                ),
              )
              : Container(),
        ),
      ],
    );
  }

  final BoxDecoration backgroundGradient = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff1102C6),
        Color(0xff4275FA),
      ],
      stops: [0.0, 1.0],
      begin: FractionalOffset.bottomRight,
      end: FractionalOffset.topLeft,
      tileMode: TileMode.clamp,
    ),
  );
}

class _HomeError extends StatelessWidget {
  const _HomeError({Key? key}) : super(key: key);

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
