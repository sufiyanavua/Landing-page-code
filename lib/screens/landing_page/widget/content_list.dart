// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:avua/screens/landing_page/widget/hover_effect.dart';

class ContentLists extends StatelessWidget {
  const ContentLists({
    Key? key,
    required this.widthLen,
    required this.color,
  }) : super(key: key);

  final double widthLen;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final width1 = SizedBox(
      width: widthLen,
    );
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 30),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              width1,
              InkWell(
                onTap: () {},
                child: HoveringWidget(
                  text: "About us",
                  color: color,
                ),
              ),

              width1,
              InkWell(
                onTap: () {},
                child: HoveringWidget(
                  text: "Blog",
                  color: color,
                ),
              ),

              width1,
              InkWell(
                onTap: () {},
                child: HoveringWidget(
                  text: "Contact Us",
                  color: color,
                ),
              ),

              width1,
              // const HoveringWidget(
              //   text: "Recruiter",
              // ),

              // width1,
              // * toggle button for login & signUp
              // const AuthToggleButton(),
            ],
          ),
        ],
      ),
    );
  }
}
