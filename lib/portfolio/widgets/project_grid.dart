import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/portfolio/widgets/project_grid_item.dart';
import 'package:portfolio/utils/constants.dart';

class ProjectGrid extends StatefulWidget {
  const ProjectGrid({Key? key}) : super(key: key);

  @override
  State<ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<ProjectGrid> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimationLimiter(
      child: BlocBuilder<PortfolioBloc, PortfolioState>(
        buildWhen: (previous, current) =>
            previous.hoveredPortfolioId != current.hoveredPortfolioId,
        builder: (context, state) {
          return MasonryGridView.count(
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
            itemCount: state.portfolioData?.projects?.length ?? 6,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 750),
                child: SlideAnimation(
                  horizontalOffset: -50.0,
                  child: FadeInAnimation(
                    child: ProjectGridItem(
                      projectData: state.portfolioData?.projects?[index],
                      hoveredId: state.hoveredPortfolioId,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}