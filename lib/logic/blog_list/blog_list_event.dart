part of 'blog_list_bloc.dart';

abstract class BlogListEvent extends Equatable {
  const BlogListEvent();

  @override
  List<Object> get props => [];
}

class BlogListAllEvent extends BlogListEvent {
  final int pageNo;
  final int noOfBlogs;

  const BlogListAllEvent({required this.pageNo, required this.noOfBlogs});
}
