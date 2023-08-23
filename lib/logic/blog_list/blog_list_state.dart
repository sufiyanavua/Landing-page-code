// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_list_bloc.dart';

abstract class BlogListState extends Equatable {
  const BlogListState();

  @override
  List<Object> get props => [];
}

class BlogListInitial extends BlogListState {}

class BlogLoading extends BlogListState {}

class BlogEmpty extends BlogListState {}

class BlogListLoaded extends BlogListState {
  final int pageNo;
  final int noOfBlogs;
  final BlogListModel blogModel;
  final int currentPage;

  const BlogListLoaded({
    required this.pageNo,
    required this.noOfBlogs,
    required this.blogModel,
    required this.currentPage,
  });
}
