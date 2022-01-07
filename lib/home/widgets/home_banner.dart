import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/home/bloc/home_bloc.dart';
import 'package:portfolio/home/repository_layer/models/home_repository_model.dart';
import 'package:portfolio/home/widgets/wave_clipper.dart';
import 'package:portfolio/utils/constants.dart';

double _tablet = 900;
double _mobile = 700;

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

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
  const _HomeLoaded({Key? key, required this.homeData}) : super(key: key);

  final HomeRepoModel? homeData;

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
            height: 525,
            color: Colors.white.withOpacity(0.1),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        Positioned(
          bottom: 50,
          right: 0,
          child: Image.asset(
            'assets/images/ellipse-2.png',
            height: 400,
            color: Colors.white.withOpacity(0.15),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        Positioned(
          left: mWidth * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HELLO I'M ${homeData!.name.toUpperCase()}",
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
              Text(
                homeData?.qualification.toString().toUpperCase() ?? 'Unknown',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                width: 100,
                child: Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
              ),
              Text(
                homeData?.location.toString() ?? 'Anonymous',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  bannerButton(
                    () {},
                    Colors.white,
                    'Hire Me',
                    primaryColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  bannerButton(
                    () {},
                    Colors.transparent,
                    'Get CV',
                    Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          right: mWidth * 0.05,
          child: Image.asset(
            "assets/images/hero-img.png",
            width: size.width > _tablet ? 500 : 400,
          ),
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

  bannerButton(
    Function() onTap,
    Color color,
    String title,
    Color titleColor,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.white),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(120, 40),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
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
