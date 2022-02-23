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
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
