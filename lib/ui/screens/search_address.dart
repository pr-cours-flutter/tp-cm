import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tp_cm_2022/repositories/address_repository.dart';

import '../../models/address.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  final AddressRepository _addressRepository = AddressRepository();
  List<Address> _addresses = [];
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adresse'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (value.length >= 3) {
                _timer?.cancel();
                _timer = Timer(const Duration(milliseconds: 500), () {
                  _addressRepository.fetchAddresses(value).then((result) {
                    setState(() {
                      _addresses = result;
                    });
                  }, onError: (e, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Une erreur est survenue')));
                  });
                });
              }
            },
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_pin),
                labelText: "Address de l'entreprise"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _addresses.length,
                  itemBuilder: (context, index) {
                    final Address address = _addresses[index];
                    return ListTile(
                      onTap: () => Navigator.of(context).pop(address),
                      leading: const Icon(Icons.location_pin),
                      title: Text(
                        '${address.street}, ${address.postcode} ${address.city}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                          '[${address.position.latitude};${address.position.longitude}]'),
                    );
                  }))
        ],
      ),
    );
  }
}
