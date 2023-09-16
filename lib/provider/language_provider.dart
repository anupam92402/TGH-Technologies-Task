import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tgh_technologies_task/repository/language_repository.dart';


class LanguageProvider extends ChangeNotifier {

  List<String>list = [];

  String _from = 'en';

  String _to = 'hi';

  String _text = 'hello how are you';

  String _translatedText = '';

  String get from => _from;

   set from(value){
    _from = value;
    notifyListeners();
  }

  String get to => _to;

  set to(value){
    _to = value;
    notifyListeners();
  }
  String get translatedText => _translatedText;

  set translatedText(value){
    _translatedText = value;
    notifyListeners();
  }

  void getLanguagesList() async{
    list=[];
    list = await LanguageRepo().getAllLanguages();

    notifyListeners();
  }

  String get text => _text;

  set text(value){
    _text = value;
    notifyListeners();
  }

  void translateText()async{

    translatedText = await LanguageRepo().translateText(text: _text, sourceLang: from, targetLang: to);
    log('text is $_translatedText}');
  }

}