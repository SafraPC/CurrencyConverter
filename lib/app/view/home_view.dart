import 'package:currencyconverter/app/components/currency_input.dart';
import 'package:currencyconverter/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  TextEditingController fromValueController = TextEditingController();
  TextEditingController toValueController = TextEditingController();
  late HomeController singletonController;

  @override
  void initState() {
    super.initState();
    singletonController = HomeController(
        fromValueController: fromValueController,
        toValueController: toValueController);

    singletonController.getData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      viewportBuilder: (context, position) => SingleChildScrollView(
        controller: ScrollController(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              CurrencyInput(
                singletonController: singletonController,
                isFromInput: true,
                input: fromValueController,
              ),
              const SizedBox(
                height: 40,
              ),
              CurrencyInput(
                singletonController: singletonController,
                isFromInput: false,
                input: toValueController,
              ),
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
                onPressed: singletonController.convert,
                child: const Text(
                  "CONVERTER",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
