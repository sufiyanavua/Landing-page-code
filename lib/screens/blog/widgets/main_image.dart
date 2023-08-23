// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../domain/blog_model/blog_model.dart';

class MainImageWithTitle extends StatelessWidget {
  const MainImageWithTitle({
    Key? key,
    required this.data,
    required this.id,
    required this.height,
  }) : super(key: key);

  final Data data;
  final String id;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: height < 700 ? 400 : 500,
      width: double.infinity,
      child: Column(
        children: [
          //* main image
          Container(
            color: Colors.grey,
            height: height < 700 ? 400 : 500,
            width: double.infinity,
            child: Image.network(
              data.content!.mainImage!,
              fit: BoxFit.cover,
            ),
          ),
          //* main title
        ],
      ),
    );
  }
}
