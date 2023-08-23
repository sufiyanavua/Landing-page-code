// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_view_bloc.dart';

abstract class BlogViewState extends Equatable {
  const BlogViewState();

  @override
  List<Object> get props => [];
}

class BlogViewInitial extends BlogViewState {}

class BlogViewLoading extends BlogViewState {}

class BlogViewError extends BlogViewState {}

class BlogViewLoaded extends BlogViewState {
  final BlogModel blogModel;
  const BlogViewLoaded({
    required this.blogModel,
  });
}
