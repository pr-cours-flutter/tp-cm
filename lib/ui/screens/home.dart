import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_cm_2022/blocs/company_cubit.dart';

import '../../models/company.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyDigitalMap'),
      ),
      body: BlocBuilder<CompanyCubit, List<Company>>(
        builder: (context, state) {
          return ListView.builder(
              itemBuilder: (context, index) {
                final Company company = state[index];
                return ListTile(
                  onTap: () {},
                  title: Text(company.name),
                  subtitle: Text(
                      '${company.address.street}, ${company.address.city}'),
                );
              },
              itemCount: state.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addCompany');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
