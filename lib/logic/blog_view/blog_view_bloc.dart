import 'package:avua/domain/blog_model/blog_model.dart';
import 'package:avua/resources/blog_list/blog_list_services.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_view_event.dart';
part 'blog_view_state.dart';

class BlogViewBloc extends Bloc<BlogViewEvent, BlogViewState> {
  BlogViewBloc() : super(BlogViewInitial()) {
    on<BlogViewByIdEvent>((event, emit) async {
      emit(BlogViewLoading());
      BlogModel? blogModel = await BlogListServices.getBlogById(id: event.id);
      if (blogModel != null) {
        emit(BlogViewLoaded(blogModel: blogModel));
      } else {
        emit(BlogViewError());
      }
    });
  }
}
