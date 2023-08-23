import 'package:avua/core/color_constants.dart';
import 'package:avua/screens/landing_page/widget/social_media_list.dart';
import 'package:avua/widgets/logo/avua_logo.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: width >= 700
          ? const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 50,
            )
          : const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      color: ColorConstant.primaryColor,
      width: double.infinity,
      height: width >= 760 ? 160 : 180,
      child: width >= 760
          ? Padding(
              padding: EdgeInsets.only(
                left: width < 1440 ? 0 : (width - 1440) / 2,
                right: width < 1440 ? 0 : (width - 1440) / 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    color: ColorConstant.whiteColor,
                  ),
                  const Spacer(),
                  SocialMediaWidget(width: width)
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Logo(
                  color: ColorConstant.whiteColor,
                ),
                SocialMediaWidget(width: width)
              ],
            ),
    );
  }
}
