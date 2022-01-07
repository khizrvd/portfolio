import 'package:portfolio/contact/data_layer/contact_data_layer.dart';
import 'package:portfolio/contact/repository_layer/models/contact_repository_model.dart';

class ContactRepoLayer {
  ContactRepoLayer(this._contactDataLayer);

  final ContactDataLayer _contactDataLayer;

  Future<ContactRepoModel> getContactData() async {
    var _contactData = await _contactDataLayer.getContactData();
    return ContactRepoModel(
      name: _contactData.name,
      phone: _contactData.phone,
      email: _contactData.email,
    );
  }
}