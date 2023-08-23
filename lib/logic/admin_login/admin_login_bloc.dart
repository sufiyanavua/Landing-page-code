import 'package:avua/domain/admin/admin_login_response_model.dart';
import 'package:avua/domain/login_model/login_model.dart';
import 'package:avua/resources/admin_resource/admin_services.dart';

import 'package:avua/routes/route_names.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'admin_login_event.dart';
part 'admin_login_state.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  AdminLoginBloc() : super(AdminLoginInitial()) {
    on<AdminLoginEventFunction>((event, emit) async {
      emit(AdminLoginStarted());
      LoginModel loginModel =
          LoginModel(email: event.email, password: event.password);
      AdminLoginResponseModel? adminLoginResponseModel =
          await AdminServices.adminLoginRequest(loginModel, event.context);
      if (adminLoginResponseModel != null) {
        if (adminLoginResponseModel.msg == "sucessfully login") {
          if (event.context.mounted) {}
          event.context.go(RoutesName.adminDashboard);
        }
        emit(
          AdminLoginFinished(
            token: adminLoginResponseModel.data!,
          ),
        );
      } else {
        emit(AdminLoginError());
      }
    });
  }
}
