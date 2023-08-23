import 'package:avua/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(RoutesName.landingPage);
        },
        child: SizedBox(
          // color: Colors.amber,
          height: width < 1440
              ? 50
              : width <= 550
                  ? 40
                  : 90,
          child: SvgPicture.asset(
            "assets/logo.svg",
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
