part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class HomeDataLoaded extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class NavButtonTapped extends HomeEvent {
  NavButtonTapped(this.controller);
final double? controller;

  @override
  List<Object?> get props => [controller];
}
