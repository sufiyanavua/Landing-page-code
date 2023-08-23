import 'package:avua/core/constants.dart';
import 'package:avua/domain/blog_model/blog_model.dart';
import 'package:avua/screens/blog/widgets/constants.dart';
import 'package:flutter/material.dart';

class BlogContents extends StatelessWidget {
  const BlogContents({
    super.key,
    required this.data,
    required this.width,
  });

  final Data data;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width <= 550 ? 20 : 80,
            ),
            child: Container(
              // color: Colors.green,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.content!.sections![index].image != ""
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                child: SizedBox(
                                  width: width * 0.7,
                                  child: Image.network(
                                    data.content!.sections![index].image!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 1,
                        ),
                  // SizeConstants.height20,
                  Text(
                    data.content!.sections![index].title!,
                    style: BlogConstants.titleStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizeConstants.height20,
                  Text(
                    data.content!.sections![index].content ?? "",
                    style: BlogConstants.contentStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizeConstants.height10,
                  data.content!.sections![index].subheadavailable!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index2) {
                              SubData subData = data
                                  .content!.sections![index].subdata![index2];
                              return Container(
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "• ${subData.title!}",
                                      textAlign: TextAlign.start,
                                      style: BlogConstants.subTitleStyle,
                                    ),
                                    SizeConstants.height10,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        subData.content!,
                                        textAlign: TextAlign.start,
                                        style:
                                            BlogConstants.subTitleContentStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount:
                                data.content!.sections![index].subdata!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizeConstants.height10;
                            },
                          ),
                        )
                      : const SizedBox(
                          height: 1,
                        ),
                ],
              ),
            ),
          );
        },
        itemCount: data.content!.sections!.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizeConstants.height20;
        },
      ),
    );
  }
}
