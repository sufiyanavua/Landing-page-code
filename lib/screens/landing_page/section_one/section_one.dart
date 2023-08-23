import 'dart:developer';

import 'package:avua/core/color_constants.dart';

import 'package:avua/screens/landing_page/section_one/widgets/content.dart';
import 'package:avua/screens/landing_page/section_one/widgets/image.dart';

import 'package:flutter/material.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    log(width.toString(), name: 'width of section one');

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              height: width <= 1440 ? width * 0.40 : 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: ColorConstant.primaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            // * background color
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: ColorConstant.primaryColor,
                // border: const Border(
                //   top: BorderSide(
                //     color: ColorConstant.primaryColor,
                //     width: 0,
                //   ),
                // ),
                border: Border.all(
                  width: 0,
                  color: ColorConstant.primaryColor,
                ),
              ),
              height: width >= 1440
                  ? 530
                  : width >= 770
                      ? width * 0.37
                      : width <= 550
                          ? width * 1.3
                          : width * 1,
              width: double.infinity,
              // width: width,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width <= 770 ? 0 : 80,
                right: width <= 770 ? 0 : 80,
              ),
              child: width >= 770
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: width < 1440 ? 0 : (width - 1440) / 2,
                        right: width < 1440 ? 0 : (width - 1440) / 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Content(width: width),
                          Column(
                            children: [
                              SizedBox(
                                // color: Colors.black,
                                width: 300,
                                height: width * 0.03,
                              ),
                              HomeImage(
                                height: height,
                                width: width,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Content(width: width),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HomeImage(
                                height: height,
                                width: width,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
