import 'package:currencyconverter/app/components/currency_input.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 16, right: 16, bottom: 16),
      child: (Column(
        children: [
          const Icon(
            Icons.change_circle,
            size: 75,
            color: Colors.amber,
          ),
          const SizedBox(
            height: 40,
          ),
          const CurrencyInput(),
          const SizedBox(
            height: 40,
          ),
          const CurrencyInput(),
          const SizedBox(
            height: 64,
          ),
          ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                "CONVERTER",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {}),
        ],
      )),
    );
  }
}
