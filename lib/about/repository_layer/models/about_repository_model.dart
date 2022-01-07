import 'package:equatable/equatable.dart';

class AboutRepoModel extends Equatable {
  const AboutRepoModel({
    this.name,
    this.qualification,
    this.location,
    this.description,
    this.hobbies,
    this.skills,
  });

  final String? name;
  final String? qualification;
  final String? location;
  final String? description;
  final List? hobbies;
  final List? skills;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qualification': qualification,
      'location': location,
      'description': description,
      'hobbies': hobbies,
      'skills': skills,
    };
  }

  factory AboutRepoModel.fromJson(Map<String, dynamic> map) {
    return AboutRepoModel(
      name: map['name'],
      qualification: map['qualification'],
      location: map['location'],
      description: map['description'],
      hobbies: map['hobbies'],
      skills: map['skills'],
    );
  }

  @override
  List<Object?> get props =>
      [name, qualification, location, description, hobbies, skills];
}
