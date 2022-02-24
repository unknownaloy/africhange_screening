import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/reusables/calculator_display_text.dart';
import 'package:africhange_screening/reusables/currency_convert_button.dart';
import 'package:africhange_screening/reusables/currency_input_field.dart';
import 'package:africhange_screening/reusables/currency_select_options.dart';
import 'package:africhange_screening/reusables/custom_app_bar.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    context.read<HomeViewModel>().fetchLatestCurrencyRates();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 48.0,
          ),
          child: Consumer<HomeViewModel>(
            builder: (_, model, __) {
              return model.requestState.map(
                idle: (_) => Text("Nothing to load"),
                loading: (_) => const Center(
                  child: CircularProgressIndicator(
                    color: kAccentColor,
                    strokeWidth: 2.0,
                  ),
                ),
                error: (event) => Center(
                  child: Text(
                    event.error,
                  ),
                ),
                success: (_) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// App bar
                      const CustomAppBar(),

                      const SizedBox(
                        height: 64.0,
                      ),

                      /// Currency calculator display text
                      const CalculatorDisplayText(),

                      const CurrencyInputField(),

                      const SizedBox(
                        height: 24.0,
                      ),

                      IgnorePointer(
                        child: TextField(
                          style: Theme.of(context).textTheme.bodyText2,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: Text(
                                model.toCurrency,
                                style: const TextStyle(color: kSuffixColor),
                              ),
                            ),
                            suffixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40.0),

                      /// Currency switch display
                      Row(
                        children: [
                          Expanded(
                            child: CurrencySelectOption(
                              defaultOption: model.fromCurrency,
                              onOptionChange: (option) =>
                                  model.updateFromCurrencyOption(option),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => model.swapFromAndToCurrencies(),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Icon(Icons.sync_alt),
                            ),
                          ),
                          Expanded(
                            child: CurrencySelectOption(
                              defaultOption: model.toCurrency,
                              onOptionChange: (option) =>
                                  model.updateToCurrencyOption(option),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 48.0,
                      ),

                     const CurrencyConvertButton(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
