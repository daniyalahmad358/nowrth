import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nowrth/global/api.dart';

class ApiProvider {
  static String mainUrl = Api.apiUrl;
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json'
  };

  static String? token;

  static void addTokenToheader() {
    if (token != null) {
      _headers.addEntries([MapEntry('Authorization', 'bearer ${token!}')]);
    }
  }

  static Future<void> setToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> extractedUserData = Map<String, dynamic>.from(
        json.decode(sharedPreferences.getString('userData') as String));

    token = (extractedUserData['token'] as String?);
  }

  static Future post({required String url, required body}) async {
    await setToken();
    String apiUrl = mainUrl + url;
    addTokenToheader();
    return http.post(
      Uri.parse(apiUrl),
      headers: _headers,
      body: json.encode(body),
      encoding: Encoding.getByName('utf-8'),
    );
  }

  static Future put({required String url, required body}) async {
    await setToken();
    String apiUrl = mainUrl + url;
    addTokenToheader();
    return http.put(
      Uri.parse(apiUrl),
      headers: _headers,
      body: json.encode(body),
      encoding: Encoding.getByName('utf-8'),
    );
  }

  static Future get({required String url}) async {
    await setToken();
    String apiUrl = mainUrl + url;
    addTokenToheader();
    return http.get(
      Uri.parse(apiUrl),
      headers: _headers,
    );
  }

  static Future delete({required String url}) async {
    await setToken();
    String apiUrl = mainUrl + url;
    addTokenToheader();
    return http.delete(
      Uri.parse(apiUrl),
      headers: _headers,
    );
  }
}
