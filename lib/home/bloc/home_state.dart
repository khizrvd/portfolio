part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.homeData,
  });
  final HomeStatus homeStatus;
  final HomeRepoModel? homeData;

  HomeState copyWith({
    HomeStatus? homeStatus,
    HomeRepoModel? homeData,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      homeData: homeData ?? this.homeData,
    );
  }

  @override
  List<Object?> get props => [homeStatus, homeData];
}
