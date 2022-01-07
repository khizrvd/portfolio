import 'package:equatable/equatable.dart';

class AboutDataModel extends Equatable {
  const AboutDataModel({
    required this.name,
    this.qualification,
    this.location,
    this.description,
    this.hobbies,
    this.skills,
  });

  final String name;
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

  factory AboutDataModel.fromJson(Map<String, dynamic> map) {
    return AboutDataModel(
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
