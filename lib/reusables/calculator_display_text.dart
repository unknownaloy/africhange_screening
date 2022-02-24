import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';

class CalculatorDisplayText extends StatelessWidget {
  const CalculatorDisplayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Currency \nCalculator",
        style: Theme.of(context).textTheme.headline1,
        children: [
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: kAccentColor),
          ),
        ],
      ),
    );
  }
}
