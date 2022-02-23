import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
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
                      // TODO: Move to reusable component
                      /// App bar
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/menu.png",
                              width: 24.0,
                              height: 24.0,
                              color: kAccentColor,
                            ),
                            Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 64.0,
                      ),

                      /// Currency calculator text
                      RichText(
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
                      ),

                      TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Text(
                              "EUR",
                              style: TextStyle(color: kSuffixColor),
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                      ),

                      const SizedBox(
                        height: 24.0,
                      ),

                      TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Text(
                              "NGN",
                              style: TextStyle(color: kSuffixColor),
                            ),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                      ),

                      const SizedBox(height: 40.0),

                      /// Currency switch display
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                value: "EUR",
                                isExpanded: true,
                                isDense: true,
                                underline: Container(),
                                iconEnabledColor: kAccentColor,
                                dropdownColor: kWhiteColor,
                                items: model.currencyRates
                                    .map<DropdownMenuItem<String>>(
                                        (CurrencyRate value) {
                                  return DropdownMenuItem<String>(
                                    value: value.symbol,
                                    child: Text(
                                      value.symbol,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  // setState(() {
                                  //   _dropdownMenuSelected = value;
                                  // });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(Icons.sync_alt),
                          ),
                          Expanded(
                            child: Container(
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
                                value: "NGN",
                                isExpanded: true,
                                isDense: true,
                                underline: Container(),
                                iconEnabledColor: kAccentColor,
                                dropdownColor: kWhiteColor,
                                items: model.currencyRates
                                    .map<DropdownMenuItem<String>>(
                                        (CurrencyRate value) {
                                      return DropdownMenuItem<String>(
                                        value: value.symbol,
                                        child: Text(
                                          value.symbol,
                                          style:
                                          Theme.of(context).textTheme.bodyText2,
                                        ),
                                      );
                                    }).toList(),
                                onChanged: (String? value) {
                                  // setState(() {
                                  //   _dropdownMenuSelected = value;
                                  // });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 48.0,
                      ),

                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kAccentColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(56.0)),
                        ),
                        child: Text(
                          "Convert",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
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
