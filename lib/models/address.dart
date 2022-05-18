import 'package:latlong2/latlong.dart';

class Address {
  final String street;
  final String city;
  final String postcode;
  final LatLng position;

  const Address(this.street, this.city, this.postcode, this.position);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final String street = properties['name'];
    final String postcode = properties['postcode'];
    final String city = properties['city'];

    final Map<String, dynamic> geometry = json['geometry'] ?? {};
    final double latitude = geometry['coordinates'][1];
    final double longitude = geometry['coordinates'][0];
    final LatLng position = LatLng(latitude, longitude);

    return Address(street, postcode, city, position);
  }
}
