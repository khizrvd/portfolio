import 'package:equatable/equatable.dart';

class HomeRepoModel extends Equatable {
  const HomeRepoModel({required this.name, this.qualification, this.location});

  final String name;
  final String? qualification;
  final String? location;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qualification': qualification,
      'location': location,
    };
  }

  factory HomeRepoModel.fromJson(Map<String, dynamic> map) {
    return HomeRepoModel(
      name: map['name'],
      qualification: map['qualification'],
      location: map['location'],
    );
  }

  @override
  List<Object?> get props => [name, qualification, location];
}
