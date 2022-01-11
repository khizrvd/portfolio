part of 'portfolio_bloc.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioStatus = PortfolioStatus.initial,
    this.portfolioData,
    this.hoveredPortfolioId,
  });
  final PortfolioStatus portfolioStatus;
  final PortfolioRepoModel? portfolioData;
  final int? hoveredPortfolioId;

  PortfolioState copyWith({
    PortfolioStatus? portfolioStatus,
    PortfolioRepoModel? portfolioData,
    int? hoveredPortfolioId,
  }) {
    return PortfolioState(
      portfolioStatus: portfolioStatus ?? this.portfolioStatus,
      portfolioData: portfolioData ?? this.portfolioData,
      hoveredPortfolioId: hoveredPortfolioId ?? this.hoveredPortfolioId,
    );
  }

  @override
  List<Object?> get props => [
        portfolioStatus,
        portfolioData,
        hoveredPortfolioId,
  ];
}