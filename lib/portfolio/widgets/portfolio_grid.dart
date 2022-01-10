import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/repository_layer/models/portfolio_repository_model.dart';

class PortfolioGrid extends StatelessWidget {
  const PortfolioGrid(
      {Key? key, required this.portfolioData, required this.index})
      : super(key: key);

  final PortfolioRepoModel? portfolioData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          portfolioData?.projects?[index]['image'].toString() ?? '',
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
