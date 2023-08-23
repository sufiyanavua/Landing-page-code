import 'package:flutter/material.dart';

class SectionTwoImage extends StatelessWidget {
  const SectionTwoImage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width <= 1440
          ? 450
          : width >= 770
              ? 350
              : height * 0.4,
      child: Image.network(
          "https://res.cloudinary.com/dxlxzkbqd/image/upload/v1691381998/employeee8f7fe0b-b3e6-4625-92d9-eb51c6e9598a.png"),
    );
  }
}
