import 'package:equatable/equatable.dart';

class ContactDataModel extends Equatable {
  const ContactDataModel({required this.name, this.phone, this.email});

  final String name;
  final String? phone;
  final String? email;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory ContactDataModel.fromJson(Map<String, dynamic> map) {
    return ContactDataModel(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  @override
  List<Object?> get props => [name, phone, email];
}
