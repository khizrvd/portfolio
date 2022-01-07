part of 'portfolio_bloc.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioStatus = PortfolioStatus.initial,
    this.portfolioData,
  });
  final PortfolioStatus portfolioStatus;
  final PortfolioRepoModel? portfolioData;

  PortfolioState copyWith({
    PortfolioStatus? portfolioStatus,
    PortfolioRepoModel? portfolioData,
  }) {
    return PortfolioState(
      portfolioStatus: portfolioStatus ?? this.portfolioStatus,
      portfolioData: portfolioData ?? this.portfolioData,
    );
  }

  @override
  List<Object?> get props => [portfolioStatus, portfolioData];
}