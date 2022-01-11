import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/portfolio/repository_layer/models/project_repo_model.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({Key? key, required this.projectData}) : super(key: key);

  final ProjectRepoModel? projectData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        return InkWell(
          mouseCursor: MouseCursor.uncontrolled,
          onTap: () {},
          onHover: (hover) {
            if (hover) {
              BlocProvider.of<PortfolioBloc>(context).add(
                MouseHovered(projectData?.id ?? 0),
              );
            } else {
              BlocProvider.of<PortfolioBloc>(context).add(
                MouseUnHovered(0),
              );
            }
          },
          child: state.hoveredPortfolioId == projectData?.id
              ? Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        projectData?.image ?? '',
                        color: Colors.black.withOpacity(0.5),
                        colorBlendMode: BlendMode.multiply,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.blue,
                          );
                        },
                      ),
                      Text(
                        projectData?.title?.toString() ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              : Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.network(
                    projectData?.image ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                        color: Colors.blue,
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
