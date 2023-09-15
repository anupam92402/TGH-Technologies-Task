import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:tgh_technologies_task/util/api.dart';
import 'app_exception.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService instance = ApiService._initialize();

  ApiService._initialize();

  factory ApiService() {
    return instance;
  }

  Future<List<String>> getAllLanguages() async {
    List<String> languageList = [];

    try {
      final response = await http.get(
        Uri.parse(Api.baseUrl + Api.languageEndPoint),
        headers: {
          "x-rapidapi-host": "google-translate1.p.rapidapi.com",
          "x-rapidapi-key": Api.apiKey,
        },
      );
      log('${ApiService().runtimeType} response from api is ${response.body}');
      dynamic parsedJson = returnResponse(response);

      List<dynamic> languages =
          parsedJson["data"]["languages"] ;
      for (int i = 0; i < languages.length; i++) {
        Map<String, dynamic> firstMap = languages[i];
        String key = firstMap
            .keys.first; // This gets the first (and only) key in the map
        languageList.add(firstMap[key] ?? ''); // T
      }
      log('${ApiService().runtimeType} all languages are $languageList');
      return languageList;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('${ApiService().runtimeType.toString()} error caught with usda api is $e');
      rethrow;
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}