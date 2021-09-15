import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nowrth/utils/api.dart';

class ApiProvider {
  String mainUrl = Api.authUrl;
  final Map<String, String> _headers = {'Content-Type': 'application/json'};

  String? get token {
    SharedPreferences.getInstance().then((value) {
      // var extractedUserData = json.decode(value.getString('userData') as String)
      // as Map<String, Object>;

      Map<String, dynamic> extractedUserData = Map<String, dynamic>.from(
          json.decode(value.getString('userData') as String));

      return (extractedUserData["token"] as String?);
    });
  }

  void checkToken() {
    if (token != null) {
      _headers.addEntries([MapEntry('Authorization', 'bearer ' + token!)]);
    }
  }

  Future post({required String url, required body}) {
    String apiUrl = mainUrl + url;
    checkToken();
    return http.post(
      Uri.parse(apiUrl),
      headers: _headers,
      body: json.encode(body),
      encoding: Encoding.getByName("utf-8"),
    );
  }
}
