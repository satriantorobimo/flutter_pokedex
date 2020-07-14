import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtil {
  static final NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(String url, {Map<String, dynamic> headers}) async {
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError((dynamic err) => throw Exception(
        'Error while fetching data')); //.timeout(Duration(milliseconds: 10000));
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic> headers, String body}) async {
    return http
        .post(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError(
            (dynamic err) => throw Exception('Error while fetching data'));
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic> headers, String body}) async {
    return http
        .put(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(body);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError(
            (dynamic err) => throw Exception('Error while fetching data'));
  }

  Future<dynamic> delete(String url, {Map<String, dynamic> headers}) async {
    return http.delete(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while executing data');
      }
    }).catchError(
        (dynamic err) => throw Exception('Error while executing data'));
  }
}
