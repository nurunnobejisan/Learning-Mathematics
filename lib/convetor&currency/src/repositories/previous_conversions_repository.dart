import 'package:jisan/convetor&currency/src/data/database_helper.dart';
import 'package:jisan/convetor&currency/src/data/models/previous_conversions_model.dart';

class PreviousConversionsRepository {
  Future<List<PreviousConversionModel>> getPreviousConversionsRepo() async {
    final resultAPI = await DatabaseHelper.getAllConversion();
    return resultAPI;
  }
}
