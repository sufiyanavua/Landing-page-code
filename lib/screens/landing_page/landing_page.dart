import 'dart:developer';
import 'package:avua/core/color_constants.dart';
import 'package:avua/core/constants.dart';
import 'package:avua/screens/landing_page/blog_section.dart/blog_section.dart';
import 'package:avua/screens/landing_page/section_one/section_one.dart';
import 'package:avua/screens/landing_page/section_two/section_two.dart';
import 'package:avua/screens/landing_page/wait_list_section/wait_list_section.dart';
import 'package:avua/screens/landing_page/widget/landing_page_navbar.dart';
import 'package:avua/widgets/copyright.dart';
import 'package:avua/widgets/footer.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    log(width.toString(), name: "width of landing page");

    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //* Nav Bar
              PreferredSize(
                preferredSize: Size(width, 100),
                child: LandingPageNavBar(width: width),
              ),
              SectionOne(
                height: height,
                width: width,
              ),
              //* section two
              Container(
                color: Colors.white,
                child: SectionTwo(
                  height: height,
                  width: width,
                ),
              ),
              // SizeConstants.height30,
              SizeConstants.height10,
              //* notify email
              WaitListSection(width: width),
              //*Blog section
              Container(
                  color: ColorConstant.whiteColor,
                  child: BlogSection(
                    width: width,
                  )),
              Footer(width: width),
              //*  Footer,
              const Copyright(),
            ],
          ),
        ),
      ),
    );
  }
}
