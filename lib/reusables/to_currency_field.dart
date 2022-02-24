import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToCurrencyField extends StatelessWidget {
  const ToCurrencyField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.toCurrencyRate.rate.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              model.toCurrencyRate.symbol,
              style: const TextStyle(color: kSuffixColor),
            )
          ],
        ),
      ),
    );
  }
}
