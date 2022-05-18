import 'dart:convert';

import 'package:http/http.dart';

import '../models/address.dart';

class AddressRepository {
  Future<List<Address>> fetchAddresses(String query) async {
    final Response response = await get(
        Uri.parse('https://api-adresse.data.gouv.fr/search?q=$query'));
    if (response.statusCode == 200) {
      final List<Address> addresses = [];

      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("features")) {
        final List<dynamic> features = json['features'];
        for (Map<String, dynamic> feature in features) {
          addresses.add(Address.fromGeoJson(feature));
        }
      }
      return addresses;
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
