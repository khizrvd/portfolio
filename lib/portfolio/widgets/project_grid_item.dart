import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/portfolio/repository_layer/models/project_repo_model.dart';

class ProjectGridItem extends StatelessWidget {
  const ProjectGridItem({Key? key, required this.projectData, required this.hoveredId})
      : super(key: key);

  final ProjectRepoModel? projectData;
  final int? hoveredId;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
          onEnter: (_) => BlocProvider.of<PortfolioBloc>(context).add(
            MouseHovered(projectData!.id!),
          ),
          onExit: (_) => BlocProvider.of<PortfolioBloc>(context).add(
            MouseUnHovered(-1),
          ),
          child: hoveredId == projectData?.id
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
  }
}
