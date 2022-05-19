import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_cm_2022/models/company.dart';

class PreferencesRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Company company in companies) {
      listJson.add(jsonEncode(company.toJson()));
    }
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Company> companies = [];
    final List<String> listJson = prefs.getStringList('companies') ?? [];
    for (final String json in listJson) {
      companies.add(Company.fromJson(jsonDecode(json)));
    }

    return companies;
  }
}
