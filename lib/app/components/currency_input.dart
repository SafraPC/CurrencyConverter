import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyInput extends StatelessWidget {
  const CurrencyInput({super.key});

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
              items: const [
                DropdownMenuItem(
                  value: 'USD',
                  child: Text('USD'),
                ),
              ],
              onChanged: (value) {
                //!not implemented
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Flexible(
          flex: 4,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Valor da moeda",
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
