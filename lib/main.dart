import 'package:flutter/material.dart';
import 'package:tp_cm_2022/ui/screens/add_company.dart';
import 'package:tp_cm_2022/ui/screens/home.dart';

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
      },
      initialRoute: '/home',
    );
  }
}
