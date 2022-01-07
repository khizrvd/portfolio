import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/about/repository_layer/about_repository_layer.dart';
import 'package:portfolio/about/repository_layer/models/about_repository_model.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AboutRepoLayer aboutRepository;
  AboutBloc(this.aboutRepository) : super(const AboutState()) {
    on<AboutDataLoaded>(
      (event, emit) async {
        emit(
          state.copyWith(
            aboutStatus: AboutStatus.loading,
          ),
        );
        final _aboutData = await aboutRepository.getAboutData();
        emit(
          state.copyWith(
            aboutStatus: AboutStatus.loaded,
            aboutData: _aboutData,
          ),
        );
      },
    );
  }
}
