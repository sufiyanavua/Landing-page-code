// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_login_bloc.dart';

abstract class AdminLoginState extends Equatable {
  const AdminLoginState();

  @override
  List<Object> get props => [];
}

class AdminLoginInitial extends AdminLoginState {}

class AdminLoginStarted extends AdminLoginState {}

class AdminLoginFinished extends AdminLoginState {
  final String token;
  const AdminLoginFinished({
    required this.token,
  });
}

class AdminLoginError extends AdminLoginState {}
