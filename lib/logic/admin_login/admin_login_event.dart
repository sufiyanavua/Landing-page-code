// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_login_bloc.dart';

abstract class AdminLoginEvent extends Equatable {
  const AdminLoginEvent();

  @override
  List<Object> get props => [];
}

class AdminLoginEventFunction extends AdminLoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  const AdminLoginEventFunction({
    required this.email,
    required this.password,
    required this.context,
  });
}
