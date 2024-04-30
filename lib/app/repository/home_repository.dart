import 'dart:convert';

import 'package:currencyconverter/app/utils/json.dart';
import 'package:flutter/services.dart';

class HomeReposisoty {
  Future<Json?> getData() async {
    final String response =
        await rootBundle.loadString('assets/mock/currency_table.json');
    final data = await json.decode(response);
    return data;
  }
}
