import 'package:equatable/equatable.dart';

class HomeDataModel extends Equatable {
  const HomeDataModel({required this.name, this.qualification, this.location});

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

  factory HomeDataModel.fromJson(Map<String, dynamic> map) {
    return HomeDataModel(
      name: map['name'],
      qualification: map['qualification'],
      location: map['location'],
    );
  }

  @override
  List<Object?> get props => [name, qualification, location];
}
