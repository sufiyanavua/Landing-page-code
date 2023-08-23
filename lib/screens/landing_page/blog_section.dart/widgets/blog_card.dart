// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
    required this.index,
    required this.titleTextSize,
    required this.introTextSize,
    required this.cardHeight,
    required this.maxLine,
    required this.image,
    required this.title,
    required this.intro,
    required this.id,
  }) : super(key: key);
  final int index;
  final double titleTextSize;
  final double introTextSize;
  final double cardHeight;
  final int maxLine;

  final String image;
  final String title;
  final String intro;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              // fit: FlexFit.loose,
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(
                  0,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        10,
                      ),
                      topRight: Radius.circular(
                        10,
                      ),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          image,
                        ))),
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.amber,
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text(
                    //   date,
                    //   style: TextStyle(
                    //     fontSize: introTextSize,
                    //   ),
                    // ),
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleTextSize,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      intro,
                      textAlign: TextAlign.start,
                      maxLines: maxLine,
                      style: TextStyle(
                        fontSize: introTextSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Read More.",
                    //       style: TextStyle(fontSize: introTextSize),
                    //     ),
                    //     Icon(
                    //       Icons.arrow_forward_ios_rounded,
                    //       size: introTextSize,
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
