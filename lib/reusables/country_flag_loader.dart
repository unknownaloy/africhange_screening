import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CountryFlagLoader extends StatelessWidget {
  final String? flagUrl;
  const CountryFlagLoader({
    Key? key,
    this.flagUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flagUrl != null
        ? ClipOval(
            child: CachedNetworkImage(
              progressIndicatorBuilder: (_, __, ___) => Container(
                width: 24.0,
                height: 24.0,
                color: kGreyColor3,
              ),
              errorWidget: (_, __, ___) => Container(
                width: 24.0,
                height: 24.0,
                color: Colors.red,
              ),
              imageUrl: flagUrl!,
              fit: BoxFit.cover,
              width: 24.0,
              height: 24.0,
            ),
          )
        : Container(
            color: kGreyColor,
          );
  }
}
