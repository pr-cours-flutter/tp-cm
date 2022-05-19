import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../blocs/company_cubit.dart';
import '../../models/address.dart';
import '../../models/company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _addressEditingController =
      TextEditingController();
  Address? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Entreprise'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _nameEditingController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Le nom doit être renseigné';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.apartment),
                      labelText: "Nom de l'entreprise",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _addressEditingController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "L'adresse doit être renseigné";
                    } else {
                      return null;
                    }
                  },
                  readOnly: true,
                  onTap: () async {
                    address = await Navigator.of(context)
                        .pushNamed('/searchAddress') as Address?;
                    if (address != null) {
                      _addressEditingController.text =
                          '${address!.street}, ${address!.city}';
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_pin),
                      labelText: "Addresse de l'entreprise",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    validate(context);
                  },
                  child: const Text('Valider'))
            ],
          ),
        ),
      ),
    );
  }

  void validate(BuildContext context) {
    if (_formKey.currentState!.validate() && address != null) {
      final String id = const Uuid().v1();
      final String name = _nameEditingController.text;
      final Company company = Company(id, name, address!);
      BlocProvider.of<CompanyCubit>(context, listen: false).addCompany(company);
      Navigator.of(context).pop();
    }
  }
}
