import 'package:avua/domain/blog_list_model/blog_list_model.dart';

import 'package:avua/resources/blog_list/blog_list_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_list_event.dart';
part 'blog_list_state.dart';

class BlogListBloc extends Bloc<BlogListEvent, BlogListState> {
  BlogListBloc() : super(BlogListInitial()) {
    on<BlogListAllEvent>((event, emit) async {
      emit(BlogLoading());
      BlogListModel? blogModel = await BlogListServices.listAllBlogs(
          pageNo: event.pageNo, blogLength: event.noOfBlogs);
      if (blogModel != null) {
        emit(BlogListLoaded(
            pageNo: 1,
            noOfBlogs: blogModel.data!.blog!.length,
            blogModel: blogModel,
            currentPage: blogModel.data!.metadata!.currentPage! - 1));
      } else if (blogModel == null) {
        emit(BlogEmpty());
      } else {
        emit(BlogLoading());
      }
    });
  }
}
