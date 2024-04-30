import 'package:currencyconverter/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class CurrencyInput extends StatefulWidget {
  final HomeController singletonController;
  final TextEditingController input;
  final bool isFromInput;

  const CurrencyInput(
      {super.key,
      required this.singletonController,
      required this.isFromInput,
      required this.input});

  @override
  State<CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  String selectedCurrency = '';

  @override
  void initState() {
    super.initState();
    if (widget.isFromInput) {
      selectedCurrency = 'BRL';
      widget.singletonController.setFromCurrency(selectedCurrency);
      return;
    }
    selectedCurrency = 'USD';
    widget.singletonController.setToCurrency(selectedCurrency);
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in widget.singletonController.currencies) {
      items.add(DropdownMenuItem(
        value: currency,
        child: Text(currency),
      ));
    }
    return items;
  }

  UnderlineInputBorder defaultBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.amber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              isExpanded: true,
              value: selectedCurrency,
              items: getDropdownItems(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value.toString();
                  if (widget.isFromInput) {
                    widget.singletonController
                        .setFromCurrency(selectedCurrency);
                  } else {
                    widget.singletonController.setToCurrency(selectedCurrency);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 4,
          child: TextField(
            enabled: widget.isFromInput ? true : false,
            controller: widget.input,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText:
                  widget.isFromInput ? "Valor da moeda" : "Valor convertido",
              border: const UnderlineInputBorder(),
              focusedBorder: defaultBorder(),
              enabledBorder: defaultBorder(),
              disabledBorder: defaultBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
