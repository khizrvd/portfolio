part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {}

class PortfolioDataLoaded extends PortfolioEvent {
  @override
  List<Object?> get props => [];
}
class MouseHovered extends PortfolioEvent {
  MouseHovered(this.hoveredId);
  final int hoveredId;

  @override
  List<Object?> get props => [hoveredId];
}

class MouseUnHovered extends PortfolioEvent {
  MouseUnHovered(this.hoveredId);
  final int? hoveredId;

  @override
  List<Object?> get props => [hoveredId];
}
