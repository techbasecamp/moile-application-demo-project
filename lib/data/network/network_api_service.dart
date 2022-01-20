import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../exception.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  Map<String, String> _setHeaders(String? token) {
    Map<String, String> headers = {"Content-type": "application/json"};
    if (token != null) headers["Authorization"] = "Bearer $token";
    return headers;
  }

  @override
  Future getResponse(String url, {String? token}) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = _setHeaders(token);
      Uri uri = Uri.parse(baseUrl + url);
      final response = await http.get(uri, headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, dynamic> jsonBody,
      {String? token}) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = _setHeaders(token);
      Uri uri = Uri.parse(baseUrl + url);
      final response = await http.post(uri, headers: headers, body: jsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Status code : ${response.statusCode}');
    }
  }
}
