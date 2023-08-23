import 'package:avua/screens/landing_page/widget/notify_button.dart';
import 'package:flutter/material.dart';

class NotifyFormField extends StatelessWidget {
  const NotifyFormField({
    Key? key,
    required this.width,
    required this.containerHeight,
  }) : super(key: key);

  final double width;
  final double containerHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(
        width >= 770 ? 10 : 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // color: Colors.amber,
            width: width * 0.37,

            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
                hintStyle: TextStyle(fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          const NotifyButton(),
        ],
      ),
    );
  }
}
