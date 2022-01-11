
import 'package:equatable/equatable.dart';

class ProjectRepoModel extends Equatable {
  const ProjectRepoModel({this.id, this.title, this.image});
  final int? id;
  final String? title;
  final String? image;

factory ProjectRepoModel.fromJson(Map<String, dynamic> map) {
    return ProjectRepoModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
    );
  }

  @override
  List<Object?> get props => [id, title, image];
}