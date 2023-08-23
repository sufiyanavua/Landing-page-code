import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width >= 1440
          ? 650
          : width >= 770
              ? width * 0.43
              : width >= 550
                  ? width * 0.7
                  : width * 0.9,
      child: Image.network(
        "https://res.cloudinary.com/dxlxzkbqd/image/upload/v1691747925/employeedf710a38-0ac5-4870-b6dc-9dc41a3d7866.png",
        height: 500,
      ),
    );
  }
}
