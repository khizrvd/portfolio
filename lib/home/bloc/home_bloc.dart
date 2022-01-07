import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/home/repository_layer/home_repository_layer.dart';
import 'package:portfolio/home/repository_layer/models/home_repository_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepoLayer homeRepository;
  HomeBloc(this.homeRepository) : super(const HomeState()) {
    on<HomeDataLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.loading,
          ),
        );
        final _homeData = await homeRepository.getHomeData();
        emit(
          state.copyWith(
            homeStatus: HomeStatus.loaded,
            homeData: _homeData,
          ),
        );
      },
    );
  }
}
