import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jisan/convetor&currency/src/utils/apis.dart';
import 'package:jisan/convetor&currency/src/utils/AppException.dart';

class ApiClient {
  var response;
  final http.Client httpClient = http.Client();

  final Map<String, String> header = {
    HttpHeaders.contentTypeHeader: CONTEXT_TYPE_APPLICATION_JSON,
  };

  Future<Response> getRequest(String endPoint) async {
    if (kDebugMode) {
      print("endpoint of server call : $endPoint");
    }
    try {
      response = await httpClient.get(
        Uri.https("$API_BASE_URL", endPoint),
        headers: header,
      );
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }
}
