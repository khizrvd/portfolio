import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/about/bloc/about_bloc.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';
import 'package:portfolio/about/widgets/skill_grid.dart';

double _tablet = 1000;
double _mobile = 700;

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key, required this.controller}) : super(key: key);
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

class _AboutLoaded extends StatelessWidget {
  const _AboutLoaded({Key? key, required this.aboutData}) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width > _tablet ? 60 : 55,
              top: 45,
            ),
            child: Image.asset(
              'assets/images/ellipse-3.png',
              width: size.width > _tablet ? 240 : 190,
            ),
          ),
          SizedBox(
            width: size.width > _tablet ? 360 : 300,
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
