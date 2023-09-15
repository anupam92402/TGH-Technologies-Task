import 'dart:developer';

import '../data/remote/api_service.dart';

class LanguageRepo {
  final ApiService _apiService = ApiService.instance;

  Future<List<String>> getAllLanguages() async {
    List<String> languageList = [];
    try {
      languageList = await _apiService.getAllLanguages();

      log("${LanguageRepo().runtimeType} data received is:- $languageList");
    } catch (e) {
      log(e.toString());
    }
    return languageList;
  }
}