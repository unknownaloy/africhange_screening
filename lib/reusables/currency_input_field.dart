import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CurrencyInputField extends StatefulWidget {
  const CurrencyInputField({Key? key}) : super(key: key);

  @override
  _CurrencyInputFieldState createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  late final TextEditingController _textController;

  void _textListener() {
    final model = context.read<HomeViewModel>();

    final value = _textController.text.trim();
    model.updateFromCurrencyRate(value);
  }

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _textController.addListener(_textListener);
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) => TextField(
        controller: _textController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              model.fromCurrency,
              style: const TextStyle(color: kSuffixColor),
            ),
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }
}
