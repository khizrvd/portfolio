import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/portfolio/repository_layer/models/portfolio_repository_model.dart';
import 'package:portfolio/portfolio/repository_layer/portfolio_repository_layer.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepoLayer portfolioRepository;
  PortfolioBloc(this.portfolioRepository) : super(const PortfolioState()) {
    on<PortfolioDataLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            portfolioStatus: PortfolioStatus.loading,
          ),
        );
        final _portfolioData = await portfolioRepository.getPortfolioData();
        emit(
          state.copyWith(
            portfolioStatus: PortfolioStatus.loaded,
            portfolioData: _portfolioData,
          ),
        );
      },
    );

    on<MouseHovered>(
      (event, emit) async {
        emit(
          state.copyWith(
            hoveredPortfolioId: event.hoveredId,
          ),
        );

    on<MouseUnHovered>(
      (event, emit) async {
        emit(
          state.copyWith(
            hoveredPortfolioId: event.hoveredId,
          ),
        );
      },
    );
      },
    );
  }
}
