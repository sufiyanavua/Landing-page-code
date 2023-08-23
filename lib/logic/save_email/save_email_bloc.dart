import 'package:avua/domain/email_response_model/email_response_model.dart';

import 'package:avua/resources/landing_page/save_email_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'save_email_event.dart';
part 'save_email_state.dart';

class SaveEmailBloc extends Bloc<SaveEmailEvent, SaveEmailState> {
  SaveEmailBloc() : super(SaveEmailInitial()) {
    SaveEmail saveEmail = SaveEmail();
    on<SentMail>((event, emit) async {
      EmailResponseModel? emailResponseModel =
          await saveEmail.saveEmailToDatabase(
        event.email,
        event.context,
      );
      if (emailResponseModel != null) {
        if (emailResponseModel.msg ==
            "internal server error please try after some time") {
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text('Thank you! You will hear from us soon.'),
            ),
          );
        } else if (emailResponseModel.msg == "sucess") {
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text('Thank you! You will hear from us soon.'),
            ),
          );
        }
      }
    });
  }
}
