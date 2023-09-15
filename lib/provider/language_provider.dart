import 'package:flutter/cupertino.dart';
import 'package:tgh_technologies_task/repository/language_repository.dart';


class LanguageProvider extends ChangeNotifier {

  List<String>list = [];

  String _from = 'en';

  String _to = 'hi';

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

  void getLanguagesList() async{
    list=[];
    list = await LanguageRepo().getAllLanguages();

    notifyListeners();
  }
}