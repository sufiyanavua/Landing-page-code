// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:avua/core/constants.dart';
import 'package:avua/screens/landing_page/section_two/widgets/section_two_image.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width < 770 ? 20 : 80,
      ),
      child: width >= 800
          ? Padding(
              padding: EdgeInsets.only(
                left: width < 1440 ? 0 : (width - 1440) / 2,
                right: width < 1440 ? 0 : (width - 1440) / 2,
              ),
              child: FittedBox(
                child: SizedBox(
                  width: 1440,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Spacer(),
                      Container(
                        // color: Colors.green,
                        child: SectionTwoImage(
                          width: width,
                          height: height,
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: width <= 1440 ? 1 : 100,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          // color: Colors.amber,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SectionTwoContent(width: width),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Spacer(),
                SizeConstants.height30,
                SizeConstants.height30,
                Container(
                  // color: Colors.amber,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "We do the work for you",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: Color(0xFF505050),
                        ),
                      ),
                      SizeConstants.height20,
                      SizedBox(
                        height: width >= 550 ? 200 : 250,
                        width: width * 1.3,
                        child: const Text(
                          "The hiring industry is on the verge of a transformative revolution, driven by technological advancements and changing demands in the job market. Traditional hiring processes have long been plagued by inefficiencies, biases, and a lack of transparency. However, emerging technologies such as artificial intelligence, data analytics, and automation are poised to revolutionize the way companies attract, assess, and select talent.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            // fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    // color: Colors.blue,
                    child: SectionTwoImage(width: width, height: height)),
              ],
            ),
    );
  }
}

class SectionTwoContent extends StatelessWidget {
  const SectionTwoContent({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizeConstants.height10,
        SizedBox(
          // color: Colors.amber,
          height: 480,
          width: width <= 1440 ? width * 0.5 : width * 0.4,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We do the work for you",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF505050),
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
              // SizeConstants.height/30,
              Text(
                "The hiring industry is on the verge of a transformative revolution, driven by technological advancements and changing demands in the job market. Traditional hiring processes have long been plagued by inefficiencies, biases, and a lack of transparency. However, emerging technologies such as artificial intelligence, data analytics, and automation are poised to revolutionize the way companies attract, assess, and select talent.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
