import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:nowrth/utils/api.dart';

class ApiProvider {
  String mainUrl = Api.authUrl;

  Future post({required String url, required body}) {
    String apiUrl = mainUrl + url;
    return http.post(Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
        encoding: Encoding.getByName("utf-8"));
  }
}
