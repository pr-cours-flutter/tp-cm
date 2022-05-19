import 'package:flutter/material.dart';
import 'package:tp_cm_2022/repositories/preferences_repository.dart';

import '../../models/company.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PreferencesRepository _preferencesRepository = PreferencesRepository();

  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();
    _preferencesRepository.loadCompanies().then((value) {
      setState(() {
        _companies = value;
      });
    });
  }

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
            _preferencesRepository.saveCompanies(_companies);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
