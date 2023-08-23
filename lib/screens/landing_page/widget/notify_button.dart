import 'package:avua/core/color_constants.dart';
import 'package:flutter/material.dart';

class NotifyButton extends StatelessWidget {
  const NotifyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40,
        ),
        color: ColorConstant.primaryColor,
      ),
      width: 80,
      height: 50,
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          "Notify",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
