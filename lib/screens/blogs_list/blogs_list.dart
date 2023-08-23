// import 'dart:developer';

// import 'package:avua/core/color_constants.dart';
// import 'package:avua/logic/blog_list/blog_list_bloc.dart';
// import 'package:avua/screens/blogs_list/widgets/page_list.dart';
// import 'package:avua/widgets/footer.dart';
// import 'package:avua/widgets/logo/avua_logo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:number_paginator/number_paginator.dart';

// class BlogsList extends StatelessWidget {
//   const BlogsList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.sizeOf(context).width;
//     final double height = MediaQuery.sizeOf(context).height;
//     log(width.toString());
//     BlocProvider.of<BlogListBloc>(context).add(BlogListAllEvent(
//         pageNo: 1,
//         noOfBlogs: width >= 770
//             ? 9
//             : width >= 550
//                 ? 6
//                 : 4));
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             BlogListNavBar(width: width),
//             Container(
//               width: double.infinity,
//               height: 150,
//               color: ColorConstant.creamColor,
//               child: const Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "Blogs",
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text("Home/Blogs")
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.05,
//                 vertical: width * 0.03,
//               ),
//               height: width >= 770
//                   ? width * 1.04
//                   : width >= 550
//                       ? width * 1.6
//                       : width * 4.1,
//               child: BlocBuilder<BlogListBloc, BlogListState>(
//                 builder: (context, state) {
//                   if (state is BlogListLoaded) {
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             child: PageList.getPageList(
//                               numberOfPages:
//                                   state.blogModel.data!.metadata!.lastPage!,
//                               width: width,
//                               height: height,
//                             )[state.currentPage],
//                           ),
//                         ),
//                         SizedBox(
//                           width: state.blogModel.data!.metadata!.lastPage! >= 5
//                               ? width * 0.9
//                               : state.blogModel.data!.metadata!.lastPage! >= 4
//                                   ? width * 0.8
//                                   : state.blogModel.data!.metadata!.lastPage! >=
//                                           3
//                                       ? width * 0.44
//                                       : state.blogModel.data!.metadata!
//                                                   .lastPage! >=
//                                               2
//                                           ? 200
//                                           : width * 0.1,
//                           // width: 200,
//                           child: NumberPaginator(
//                             initialPage: state.currentPage,
//                             numberPages:
//                                 state.blogModel.data!.metadata!.lastPage!,
//                             onPageChange: (index) {
//                               // setState(() {
//                               //   currentPage = index;
//                               // });
//                               log(index.toString(), name: "on page index");
//                               BlocProvider.of<BlogListBloc>(context)
//                                   .add(BlogListAllEvent(
//                                       pageNo: index + 1,
//                                       noOfBlogs: width >= 770
//                                           ? 9
//                                           : width >= 550
//                                               ? 6
//                                               : 4));
//                             },
//                             config: const NumberPaginatorUIConfig(
//                               buttonSelectedBackgroundColor:
//                                   ColorConstant.primaryColor,
//                               buttonUnselectedBackgroundColor:
//                                   ColorConstant.creamColor,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               mode: ContentDisplayMode.numbers,
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ),
//             Footer(width: width),
//           ],
//         ),
//       )),
//     );
//   }
// }

import 'package:avua/widgets/logo/avua_logo.dart';
import 'package:flutter/material.dart';

import '../../core/color_constants.dart';

class BlogListNavBar extends StatelessWidget {
  const BlogListNavBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width <= 550 ? 20 : 50,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          width: double.infinity,
          height: 100,
          // color: Colors.amber,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Logo(
                color: ColorConstant.primaryColor,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
