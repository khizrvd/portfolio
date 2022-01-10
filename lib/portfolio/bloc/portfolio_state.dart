part of 'portfolio_bloc.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioStatus = PortfolioStatus.initial,
    this.portfolioData,
    this.hoverColor = false,
  });
  final PortfolioStatus portfolioStatus;
  final PortfolioRepoModel? portfolioData;
  final bool hoverColor;

  PortfolioState copyWith({
    PortfolioStatus? portfolioStatus,
    PortfolioRepoModel? portfolioData,
    bool? hoverColor,
  }) {
    return PortfolioState(
      portfolioStatus: portfolioStatus ?? this.portfolioStatus,
      portfolioData: portfolioData ?? this.portfolioData,
      hoverColor: hoverColor ?? this.hoverColor,
    );
  }

  @override
  List<Object?> get props => [portfolioStatus, portfolioData, hoverColor];
}