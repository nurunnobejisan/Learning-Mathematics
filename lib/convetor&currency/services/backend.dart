import 'dart:convert';

import 'package:dio/dio.dart';

class BackendService {
  static const _timezoneApi = "http://worldtimeapi.org/api/timezone";
  static const _getTime = "http://worldtimeapi.org/api/timezone/";
  static const _getCurrency = "https://api.exchangerate.host/latest";

  Future<dynamic> getCountryZones() async {
    try {
      var result = await Dio().get(_timezoneApi);

      return {"result": result.data, "code": result.statusCode};
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getTimeZone(String zone) async {
    try {
      var result = await Dio().get(_getTime + zone);

      return {"result": result.data, "code": result.statusCode};
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCurrency() async {
    try {
      var result = await Dio().get(_getCurrency);

      return {"result": result.data, "code": result.statusCode};
    } catch (e) {
      rethrow;
    }
  }
}
