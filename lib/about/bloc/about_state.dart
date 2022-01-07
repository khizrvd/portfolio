part of 'about_bloc.dart';

enum AboutStatus { initial, loading, loaded, error }

class AboutState extends Equatable {
  const AboutState({
    this.aboutStatus = AboutStatus.initial,
    this.aboutData,
  });
  final AboutStatus aboutStatus;
  final AboutRepoModel? aboutData;

  AboutState copyWith({
    AboutStatus? aboutStatus,
    AboutRepoModel? aboutData,
  }) {
    return AboutState(
      aboutStatus: aboutStatus ?? this.aboutStatus,
      aboutData: aboutData ?? this.aboutData,
    );
  }

  @override
  List<Object?> get props => [aboutStatus, aboutData];
}
