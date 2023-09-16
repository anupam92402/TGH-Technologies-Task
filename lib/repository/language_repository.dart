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

  Future<String> translateText(
      {required String text,
        required String sourceLang,
        required String targetLang}) async {
    try {
      text = await _apiService.translateText(text: text, sourceLang: sourceLang, targetLang: targetLang);

      log("${LanguageRepo().runtimeType} data received is:- $text");
    } catch (e) {
      log(e.toString());
    }
    return text;

  }
}