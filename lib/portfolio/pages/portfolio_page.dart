import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/portfolio/repository_layer/models/portfolio_repository_model.dart';
import 'package:portfolio/portfolio/repository_layer/models/project_repo_model.dart';
import 'package:portfolio/portfolio/widgets/project_grid.dart';
import 'package:portfolio/utils/constants.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        switch (state.portfolioStatus) {
          case PortfolioStatus.initial:
            context.read<PortfolioBloc>().add(
                  PortfolioDataLoaded(),
                );
            return const _PortfolioInitial();
          case PortfolioStatus.loading:
            return const _PortfolioLoading();
          case PortfolioStatus.loaded:
            return _PortfolioLoaded(
              portfolioData: state.portfolioData,
            );
          case PortfolioStatus.error:
          default:
            return const _PortfolioError();
        }
      },
    );
  }
}

class _PortfolioInitial extends StatelessWidget {
  const _PortfolioInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Portfolio Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _PortfolioLoading extends StatelessWidget {
  const _PortfolioLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _PortfolioLoaded extends StatefulWidget {
  const _PortfolioLoaded({
    Key? key,
    required this.portfolioData,
  }) : super(key: key);

  final PortfolioRepoModel? portfolioData;

  @override
  State<_PortfolioLoaded> createState() => _PortfolioLoadedState();
}

class _PortfolioLoadedState extends State<_PortfolioLoaded>
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
      padding: const EdgeInsets.only(top: 65.0),
      child: Column(
        children: [
          Text(
            'My Portfolio',
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            'Recent Works',
            style: TextStyle(
              fontSize: 30,
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: AnimationLimiter(
              child: MasonryGridView.count(
                crossAxisCount: size.width < mobile
                    ? 2
                    : size.width < tablet
                        ? 3
                        : 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                primary: false,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 60.0,
                ),
                itemCount: widget.portfolioData?.projects?.length ?? 6,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 750),
                    child: SlideAnimation(
                      horizontalOffset: -50.0,
                      child: FadeInAnimation(
                        child: ProjectGrid(
                          projectData: widget.portfolioData?.projects?[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PortfolioError extends StatelessWidget {
  const _PortfolioError({Key? key}) : super(key: key);

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
