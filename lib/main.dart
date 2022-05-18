import 'package:flutter/material.dart';

import 'ui/screens/add_company.dart';
import 'ui/screens/home.dart';
import 'ui/screens/search_address.dart';

void main() {
  runApp(const MyApp());
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
