import 'package:flutter/material.dart';

import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Company> _companies = [
    const Company('0', 'Entreprise 1'),
    const Company('1', 'Entreprise 2'),
    const Company('2', 'Entreprise 3'),
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
