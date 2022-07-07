import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: appDefaultPadding,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(28),
        color: appPrimaryColor[200],
        onPressed: press,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
