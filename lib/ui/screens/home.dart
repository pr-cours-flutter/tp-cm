import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../models/address.dart';
import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    Company(
        '0',
        'Entreprise 1',
        Address('Place du Ralliement', 'Angers', '49000',
            LatLng(47.471344, -0.551602))),
    Company(
        '1',
        'Entreprise 2',
        Address('Place du Ralliement', 'Angers', '49000',
            LatLng(47.471344, -0.551602))),
    Company(
        '2',
        'Entreprise 3',
        Address('Place du Ralliement', 'Angers', '49000',
            LatLng(47.471344, -0.551602))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final Company company = _companies[index];
            return ListTile(
              onTap: () {},
              title: Text(company.name),
              subtitle:
                  Text('${company.address.street}, ${company.address.city}'),
            );
          },
          itemCount: _companies.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Company? company =
              await Navigator.of(context).pushNamed('/addCompany') as Company?;

          if (company != null) {
            setState(() {
              _companies.add(company);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
