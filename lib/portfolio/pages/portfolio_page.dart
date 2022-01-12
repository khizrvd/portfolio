import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/portfolio/bloc/portfolio_bloc.dart';
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
          case PortfolioStatus.loading:
            context.read<PortfolioBloc>().add(
                  PortfolioDataLoaded(),
                );
            return const _PortfolioLoading();
          case PortfolioStatus.loaded:
            return const _PortfolioLoaded();
          case PortfolioStatus.error:
          default:
            return const _PortfolioError();
        }
      },
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

class _PortfolioLoaded extends StatelessWidget {
  const _PortfolioLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: ProjectGrid(),
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
