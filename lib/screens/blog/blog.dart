import 'dart:developer';

import 'package:avua/core/constants.dart';
import 'package:avua/logic/blog_view/blog_view_bloc.dart';
import 'package:avua/screens/blog/widgets/constants.dart';
import 'package:avua/screens/blog/widgets/main_image.dart';
import 'package:avua/screens/blogs_list/blogs_list.dart';
import 'package:avua/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/blog_model/blog_model.dart';
import 'widgets/blog_contents.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final String index;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    BlocProvider.of<BlogViewBloc>(context)
        .add(BlogViewByIdEvent(id: widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    BlocProvider.of<BlogViewBloc>(context)
        .add(BlogViewByIdEvent(id: widget.index));
    log(width.toString());
    return BlocBuilder<BlogViewBloc, BlogViewState>(
      builder: (context, state) {
        if (state is BlogViewLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BlogViewLoaded) {
          Data data = state.blogModel.data!;
          return SingleChildScrollView(
            child: SelectionArea(
              child: Column(
                children: [
                  BlogListNavBar(width: width),
                  //* main image with title
                  MainImageWithTitle(
                    data: data,
                    id: widget.index,
                    height: height,
                  ),
                  SizeConstants.height20,
                  //* title
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width <= 550 ? 20 : 80),
                      child: Text(
                        data.content!.articleTitle!,
                        textAlign: TextAlign.start,
                        style: BlogConstants.articleTitleStyle,
                      ),
                    ),
                  ),
                  //* intro
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width <= 550 ? 20 : 80,
                        ),
                        child: Text(
                          data.content!.introduction!,
                          textAlign: TextAlign.start,
                          style: BlogConstants.introStyle,
                        ),
                      ),
                    ),
                  ),
                  //* contents
                  BlogContents(data: data, width: width),
                  SizeConstants.height30,
                  SizeConstants.height30,
                  //* footer
                  Footer(width: width),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Error while fetching data, Please try again later",
            ),
          );
        }
      },
    );
  }
}
