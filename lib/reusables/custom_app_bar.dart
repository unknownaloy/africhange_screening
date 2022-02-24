import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
