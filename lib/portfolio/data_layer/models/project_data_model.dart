import 'package:equatable/equatable.dart';

class ProjectDataModel extends Equatable {
  const ProjectDataModel({this.id, this.title, this.image});
  final int? id;
  final String? title;
  final String? image;

factory ProjectDataModel.fromJson(Map<String, dynamic> map) {
    return ProjectDataModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
    );
  }

  @override
  List<Object?> get props => [id, title, image];
}