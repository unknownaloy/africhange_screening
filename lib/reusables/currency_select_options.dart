import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelectOption extends StatelessWidget {
  final String defaultOption;
  final Function(String?) onOptionChange;

  const CurrencySelectOption({
    Key? key,
    required this.defaultOption,
    required this.onOptionChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: kGreyColor,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: DropdownButton<String>(
          value: defaultOption,
          isExpanded: true,
          isDense: true,
          underline: Container(),
          iconEnabledColor: kAccentColor,
          dropdownColor: kWhiteColor,
          items: model.currencyRates
              .map<DropdownMenuItem<String>>((CurrencyRate value) {
                return DropdownMenuItem<String>(
              value: value.symbol,
              child: Row(
                children: [
                  Text("h", style: TextStyle(color: Colors.black),),
                  const SizedBox(width: 8.0,),
                  Text(
                    value.symbol,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            );
          }).toList(),

          onChanged: onOptionChange,
        ),
      ),
    );
  }
}
