import 'package:bloc/bloc.dart';

import '../models/company.dart';
import '../repositories/preferences_repository.dart';

class CompanyCubit extends Cubit<List<Company>> {
  CompanyCubit(this._preferencesRepository) : super([]);

  final PreferencesRepository _preferencesRepository;

  void addCompany(Company company) {
    emit([...state, company]);
    _preferencesRepository.saveCompanies(state);
  }

  Future<void> loadCompanies() async {
    final List<Company> companies =
        await _preferencesRepository.loadCompanies();
    emit(companies);
  }
}
