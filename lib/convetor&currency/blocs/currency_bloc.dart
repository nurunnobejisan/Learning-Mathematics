import 'package:jisan/convetor&currency/models/currency_model.dart';
import 'package:jisan/convetor&currency/services/backend.dart';

class CurrencyBloc {
  Future<Map<String, dynamic>> getCurrency() async {
    List<CurrencyModel> allCurrency = [];
    try {
      var result = await BackendService().getCurrency();
      Map<String, dynamic> currencyMap =
          result["result"]["rates"] as Map<String, dynamic>;
      currencyMap.forEach((key, value) {
        allCurrency.add(CurrencyModel(currencyName: key, price: value));
      });
      return currencyMap;
    } catch (e) {
      rethrow;
    }
  }
}
