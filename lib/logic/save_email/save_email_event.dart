// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_email_bloc.dart';

abstract class SaveEmailEvent extends Equatable {
  const SaveEmailEvent();

  @override
  List<Object> get props => [];
}

class SentMail extends SaveEmailEvent {
  final String email;
  final BuildContext context;
  const SentMail({
    required this.email,
    required this.context,
  });
}
