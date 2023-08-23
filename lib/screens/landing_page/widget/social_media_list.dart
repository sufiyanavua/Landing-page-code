import 'package:avua/core/constants.dart';
import 'package:avua/core/extensions/hover_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaList {
  static String facebook = "assets/landing_page/facebook-logo-png-9006.png";
  static String linkedIn = "assets/landing_page/linkedIn_icon.svg";
  static String twitter = "assets/landing_page/x_icon.svg";
  static String instagram = "assets/landing_page/instagram_icon.svg";
}

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (kIsWeb) {
                    html.window.open(
                        'https://www.linkedin.com/company/avua-international',
                        "LinkedIn");
                  }
                },
                child: SizedBox(
                  height: 50,
                  child: SvgPicture.asset(
                    SocialMediaList.linkedIn,
                  ),
                ),
              ).scaleOnHover(),
              SizeConstants.width10,
              InkWell(
                onTap: () {
                  if (kIsWeb) {
                    html.window.open(
                      'https://twitter.com/_Avua_',
                      "Twitter",
                    );
                  }
                },
                child: SizedBox(
                  height: 45,
                  child: SvgPicture.asset(
                    SocialMediaList.twitter,
                  ),
                ),
              ).scaleOnHover(),
              SizeConstants.width10,
              InkWell(
                onTap: () {
                  if (kIsWeb) {
                    html.window.open(
                      'https://www.instagram.com/__avua/',
                      "Instagram",
                    );
                  }
                },
                child: SizedBox(
                  height: 40,
                  child: SvgPicture.asset(
                    SocialMediaList.instagram,
                  ),
                ),
              ).scaleOnHover(),
            ],
          ),
        ],
      ),
    );
  }
}
