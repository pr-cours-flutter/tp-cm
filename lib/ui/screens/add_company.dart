import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

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
                  controller: _textEditingController,
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
    if (_formKey.currentState!.validate()) {
      final String id = const Uuid().v1();
      final String name = _textEditingController.text;
      final Company company = Company(id, name);
      Navigator.of(context).pop(company);
    }
  }
}
