import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 48.0,
          ),
          child: SingleChildScrollView(
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
                          borderRadius: BorderRadius.all(
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
                          items: <String>[
                            "NGN",
                            "EUR",
                            "USD",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0,
                                    ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          borderRadius: BorderRadius.all(
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
                          items: <String>[
                            "NGN",
                            "EUR",
                            "USD",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0,
                                    ),
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


                const SizedBox(height: 48.0,),

                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kAccentColor),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(56.0)
                    ),
                  ),
                  child: Text("Convert", style: Theme.of(context).textTheme.button,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
