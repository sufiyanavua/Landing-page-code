// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avua/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:avua/logic/blog_list/blog_list_bloc.dart';
import 'package:avua/screens/landing_page/blog_section.dart/widgets/blog_card.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;
  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  @override
  void initState() {
    BlocProvider.of<BlogListBloc>(context)
        .add(const BlogListAllEvent(pageNo: 1, noOfBlogs: 6));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.width < 500 ? 20 : 80,
        vertical: 20,
      ),
      width: double.infinity,
      height: containerHeight(context),
      // color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.width < 1440 ? 0 : (widget.width - 1440) / 2,
          right: widget.width < 1440 ? 0 : (widget.width - 1440) / 2,
        ),
        child: BlocBuilder<BlogListBloc, BlogListState>(
          builder: (context, state) {
            if (state is BlogListLoaded) {
              return CarouselSlider.builder(
                itemCount: state.noOfBlogs,
                itemBuilder: (context, index, realIndex) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        context.go(
                            "/blog/${state.blogModel.data!.blog![index].id}");
                      },
                      child: ScaleOnHover(
                        scale: 1.01,
                        child: BlogCard(
                          index: index,
                          introTextSize: introTextSize(context),
                          titleTextSize: titleTextSize(context),
                          cardHeight: cardSize(context),
                          maxLine: maxLine(context),
                          image: state
                              .blogModel.data!.blog![index].content!.mainImage!,
                          intro: state.blogModel.data!.blog![index].content!
                              .introduction!,
                          title: state.blogModel.data!.blog![index].content!
                              .articleTitle!,
                          id: state.blogModel.data!.blog![index].id!,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    autoPlayInterval: const Duration(
                      seconds: 2,
                      milliseconds: 500,
                    ),
                    height: heightFunction(context),
                    viewportFraction: viewportFunction(context),
                    enableInfiniteScroll: true,
                    autoPlay: true),
              );
            } else if (state is BlogLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(
                child: Text(
                  "Error while fetching data",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  double viewportFunction(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double viewport = screenWidth >= 1000
        ? 0.3
        : screenWidth >= 700
            ? 0.5
            : screenWidth >= 550
                ? 0.6
                : 0.9;
    return viewport;
  }

  double heightFunction(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double viewport = screenWidth >= 770
        ? 450
        : screenWidth >= 500
            ? 400
            : 400;
    return viewport;
  }

  double cardSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardSize = screenWidth >= 500 ? 350 : 100;
    return cardSize;
  }

  double aspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspect = screenWidth >= 500 ? 1 : (1.5 / 1.3);
    return aspect;
  }

  int maxLine(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int maxLine = screenWidth >= 500 ? 3 : 3;
    return maxLine;
  }

  double titleTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleSize = screenWidth >= 770
        ? 17
        : screenWidth >= 500
            ? 15
            : 14;
    return titleSize;
  }

  double introTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleSize = screenWidth >= 770
        ? 15
        : screenWidth >= 500
            ? 13
            : 12;
    return titleSize;
  }

  double horizontalPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleSize = screenWidth >= 500 ? 0 : 20;
    return titleSize;
  }

  //* Item count to make responsive
  int calculateItemCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int itemCount = screenWidth >= 770
        ? 3
        : screenWidth >= 500
            ? 2
            : 1;
    return itemCount;
  }

  //* cross Axis count to make responsive
  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth >= 770
        ? 3
        : screenWidth >= 500
            ? 2
            : 1; // Adjust the item width as needed

    return crossAxisCount;
  }

  //* container Height to make responsive
  double containerHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = screenWidth >= 770
        ? 600
        : screenWidth >= 500
            ? 600
            : 400;
    return height;
  }
}
