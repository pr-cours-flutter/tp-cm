import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_cm_2022/repositories/preferences_repository.dart';

import 'blocs/company_cubit.dart';
import 'ui/screens/add_company.dart';
import 'ui/screens/home.dart';
import 'ui/screens/search_address.dart';

void main() {
  final PreferencesRepository preferencesRepository = PreferencesRepository();

  final CompanyCubit companyCubit = CompanyCubit(preferencesRepository);

  runApp(BlocProvider<CompanyCubit>(
    create: (_) => companyCubit,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/addCompany': (context) => AddCompany(),
        '/searchAddress': (context) => const SearchAddress(),
      },
      initialRoute: '/home',
    );
  }
}
