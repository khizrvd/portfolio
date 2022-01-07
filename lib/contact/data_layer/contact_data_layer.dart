import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/contact/data_layer/models/contact_data_model.dart';

class ContactDataLayer {
  Future<ContactDataModel> getContactData() async {
    try {
      String response = await rootBundle.loadString('assets/data/contact.json');
      final decoded = jsonDecode(response) as Map<String, dynamic>;

      if (decoded.isEmpty) {
        throw decoded['message'];
      }

      final contactJson = decoded['data'];

      if (contactJson.isEmpty) {
        throw decoded['message'];
      }
      final _contactList = ContactDataModel.fromJson(contactJson);
      return _contactList;
    } catch (e) {
      throw 'Contact Page not found';
    }
  }
}
