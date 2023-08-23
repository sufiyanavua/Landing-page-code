import 'package:avua/core/color_constants.dart';
import 'package:avua/core/constants.dart';
import 'package:avua/screens/landing_page/widget/gradient_text.dart';
import 'package:avua/widgets/logo/avua_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPageNavBar extends StatelessWidget {
  const LandingPageNavBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: ColorConstant.primaryColor,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(width: 0, color: ColorConstant.primaryColor)
          ),
      child: Padding(
        padding: EdgeInsets.only(
          left: width < 1440 ? 0 : (width - 1440) / 2,
          right: width < 1440 ? 0 : (width - 1440) / 2,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width <= 770 ? 10 : 80),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(
                color: Colors.white,
              ),
              // if (width >= 770)
              Padding(
                padding: EdgeInsets.only(
                  right: width >= 800 ? 0 : 16,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(2),
                  // width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                        ),
                        child: Lottie.asset(
                          "assets/landing_page/animation_lktclrdh.json",
                          width: width <= 300 ? 25 : 30,
                          height: width <= 300 ? 25 : 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizeConstants.width10,
                      // const SizedBox(
                      //   width: 5,
                      // ),

                      GradientText(
                        "Launching Soon",
                        gradient: const LinearGradient(colors: [
                          Color(0xFFF5663A),
                          Color(0xFF5113A8),
                        ]),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: ColorConstant.secondaryColor,
                          fontSize: width <= 300
                              ? 14
                              : width <= 660
                                  ? 18
                                  : 25,
                        ),
                      ),

                      SizeConstants.width10,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
