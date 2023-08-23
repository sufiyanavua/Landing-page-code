import 'package:flutter/material.dart';

import '../core/color_constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ColorConstant.primaryColor,
      child: MaterialButton(
        // minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed as void Function()?,
        child: Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
