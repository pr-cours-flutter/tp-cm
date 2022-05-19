import 'address.dart';

class Company {
  final String id;
  final String name;
  final Address address;
  const Company(this.id, this.name, this.address);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address.toJson(),
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(json['id'], json['name'], Address.fromJson(json['address']));
  }
}
