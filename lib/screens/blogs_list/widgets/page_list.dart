import 'package:avua/logic/blog_list/blog_list_bloc.dart';
import 'package:avua/screens/landing_page/blog_section.dart/widgets/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PageList {
  static getPageList(
      {required int numberOfPages,
      required double width,
      required double height}) {
    var pages = List.generate(
        numberOfPages,
        (index) => BlocBuilder<BlogListBloc, BlogListState>(
              builder: (context, state) {
                if (state is BlogListLoaded) {
                  return GridView.builder(
                    itemCount: state.noOfBlogs,
                    //  width >= 770
                    //     ? 9
                    //     : width >= 550
                    //         ? 6
                    //         : 4,
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.go(
                                "/blog/${state.blogModel.data!.blog![index].id}");
                          },
                          child: BlogCard(
                            index: index,
                            introTextSize:
                                width >= 550 ? width * 0.01 : width * 0.03,
                            titleTextSize:
                                width >= 550 ? width * 0.012 : width * 0.035,
                            cardHeight: 120,
                            maxLine: 2,
                            image: state.blogModel.data!.blog![index].content!
                                .mainImage!,
                            title: state.blogModel.data!.blog![index].content!
                                .articleTitle!,
                            intro: state.blogModel.data!.blog![index].content!
                                .introduction!,
                            id: state.blogModel.data!.blog![index].id!,
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width >= 770
                          ? 3
                          : width >= 550
                              ? 2
                              : 1,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      // childAspectRatio:
                      //     width >= 550 ? 1 : ((width / 1.2) / (height / 4)),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ));
    return pages;
  }
}
