import 'dart:convert';

import 'package:jisan/convetor&currency/models/time_model.dart';
import 'package:jisan/convetor&currency/services/backend.dart';

class TimeBloc {
  Future<List<dynamic>> getTimeZones() async {
    try {
      List<dynamic> zoneList = [];
      var result = await BackendService().getCountryZones();
      zoneList = result["result"] as List<dynamic>;
      return zoneList;
    } catch (e) {
      rethrow;
    }
  }

  Future<TimeModel> getTimeZone(String zone) async {
    try {
      TimeModel time = TimeModel();

      var result = await BackendService().getTimeZone(zone);
      if (result["code"] == 200) {
        time = TimeModel.fromJson(result["result"]);
      }

      return time;
    } catch (e) {
      rethrow;
    }
  }
}
