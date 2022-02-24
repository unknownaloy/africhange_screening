import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyConvertButton extends StatelessWidget {
  const CurrencyConvertButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) => TextButton(
        onPressed: () {
          if (model.fromCurrencyRate == 0) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Please enter a valid amount"),
                ),
              );
            return;
          }

          model.convertCurrency();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kAccentColor),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(56.0)),
        ),
        child: Text(
          "Convert",
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
