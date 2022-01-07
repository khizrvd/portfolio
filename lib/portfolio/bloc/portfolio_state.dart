part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();
  
  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}
