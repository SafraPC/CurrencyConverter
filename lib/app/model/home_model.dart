import 'package:currencyconverter/app/utils/json.dart';

class CurrencyModel {
//based in json currency_table.json in mocks, create a model
  final String currency;
  final double value;

  CurrencyModel({required this.currency, required this.value});

  factory CurrencyModel.fromJson(Json json) {
    return CurrencyModel(
      currency: json['currency'],
      value: json['value'],
    );
  }
}
