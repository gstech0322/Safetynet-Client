import 'dart:convert';

import 'package:http/http.dart' as http;

class RestCalls {
  static Future<http.Response> post(String url, {Map<String, dynamic> body}) async {
    var response = await http.post(url, body: json.encode(body));
    return response;
  }

  static Future<http.Response> get(String url) async {
    var response = await http.get(url);
    return response;
  }

  static Future<http.Response> put(
      String url, Map<String, dynamic> body) async {
    var response = await http.put(url, body: json.encode(body));
    return response;
  }
}
