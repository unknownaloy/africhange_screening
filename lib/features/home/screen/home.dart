import 'package:africhange_screening/features/home/view_model/currency_view_model.dart';
import 'package:africhange_screening/reusables/calculator_display_text.dart';
import 'package:africhange_screening/reusables/chart_data.dart';
import 'package:africhange_screening/reusables/currency_convert_button.dart';
import 'package:africhange_screening/reusables/currency_input_field.dart';
import 'package:africhange_screening/reusables/currency_select_options.dart';
import 'package:africhange_screening/reusables/to_currency_field.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:africhange_screening/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _textController;

  void _textListener() {
    final model = context.read<CurrencyViewModel>();

    final value = _textController.text.trim();
    model.updateFromCurrencyRate(value);
  }

  @override
  void initState() {
    super.initState();

    final model = context.read<CurrencyViewModel>();

    model.fetchLatestCurrencyRates();

    model.getHistoricPriceRange();

    _textController =
        TextEditingController(text: model.fromCurrencyRate.rate.toString());
    _textController.addListener(_textListener);
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormatter();
    return SafeArea(
      child: Scaffold(
        body: Consumer<CurrencyViewModel>(
          builder: (_, model, __) {
            return model.requestState.map(
              idle: (_) => const Center(
                child: CircularProgressIndicator(
                  color: kAccentColor,
                  strokeWidth: 2.0,
                ),
              ),
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
              success: (_) => NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      sliver: SliverAppBar(
                        backgroundColor: Colors.transparent,
                        floating: false,
                        // pinned: true,
                        leading: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon:  Image.asset(
                                "assets/images/menu.png",
                                width: 32.0,
                                height: 32.0,
                                color: kAccentColor,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                                // TODO: Get the design for the Market Drawer, design and implement the logic
                              },
                              tooltip:
                              MaterialLocalizations.of(context).openAppDrawerTooltip,
                            );
                          },
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                            child: Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Currency calculator display text
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CalculatorDisplayText(),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CurrencyInputField(
                          textController: _textController,
                        ),
                      ),

                      const SizedBox(
                        height: 24.0,
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ToCurrencyField(),
                      ),

                      const SizedBox(height: 40.0),

                      /// Currency switch display
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CurrencySelectOption(
                                defaultOption: model.fromCurrencyRate.symbol,
                                onOptionChange: (option) =>
                                    model.updateFromCurrencyOption(option),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                model.swapFromAndToCurrencies();
                                _textController.text =
                                    model.fromCurrencyRate.rate.toString();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Icon(Icons.sync_alt),
                              ),
                            ),
                            Expanded(
                              child: CurrencySelectOption(
                                defaultOption: model.toCurrencyRate.symbol,
                                onOptionChange: (option) =>
                                    model.updateToCurrencyOption(option),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 48.0,
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CurrencyConvertButton(),
                      ),

                      const SizedBox(
                        height: 32.0,
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Mid-market exchange rate at ${dateFormatter.getTimeIn24HoursFormat()} UTC",
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ),

                      const SizedBox(
                        height: 32.0,
                      ),


                      model.historicPriceRequestState.map(
                        idle: (_) => const Center(
                          child: CircularProgressIndicator(
                            color: kAccentColor,
                            strokeWidth: 2.0,
                          ),
                        ),
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
                        success: (_) => const ChartData(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
