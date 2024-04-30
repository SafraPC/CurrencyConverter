import 'package:currencyconverter/app/repository/home_repository.dart';
import 'package:currencyconverter/app/utils/json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  TextEditingController fromValueController, toValueController;
  String? fromCurrency, toCurrency;

  HomeController(
      {required this.fromValueController,
      required this.toValueController,
      this.fromCurrency,
      this.toCurrency});

  HomeReposisoty reposisoty = HomeReposisoty();
  List<String> currencies = [];
  Json? data;

  Future<void> getData() async {
    Json? response = await reposisoty.getData();
    if (response == null) {
      return;
    }
    currencies = response.keys.toList();
    data = response;
  }

  void setFromCurrency(String currency) {
    fromCurrency = currency;
  }

  void setToCurrency(String currency) {
    toCurrency = currency;
  }

  void convert() {
    if (data == null ||
        fromCurrency == null ||
        toCurrency == null ||
        fromValueController.text.isEmpty) {
      toValueController.text = 'Insira o valor da moeda';
      return;
    }

    double toCurrencyFound = data?['$fromCurrency']['$toCurrency'];
    double? inputValue =
        double.tryParse(fromValueController.text.replaceAll(',', '.'));

    String? result = (inputValue! * toCurrencyFound).toStringAsFixed(2);
    toValueController.text = result;
  }
}
