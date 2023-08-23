// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_view_bloc.dart';

abstract class BlogViewEvent extends Equatable {
  const BlogViewEvent();

  @override
  List<Object> get props => [];
}

class BlogViewByIdEvent extends BlogViewEvent {
  final String id;
  const BlogViewByIdEvent({
    required this.id,
  });
}
