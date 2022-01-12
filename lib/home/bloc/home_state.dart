part of 'home_bloc.dart';

enum HomeStatus { loading, loaded, error }

class HomeState extends Equatable {
  const HomeState({
    this.homeStatus = HomeStatus.loading,
    this.homeData,
    this.page = 0,
  });
  final HomeStatus homeStatus;
  final HomeRepoModel? homeData;
  final double page;

  HomeState copyWith({
    HomeStatus? homeStatus,
    HomeRepoModel? homeData,
    double? page,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      homeData: homeData ?? this.homeData,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [homeStatus, homeData, page];
}
