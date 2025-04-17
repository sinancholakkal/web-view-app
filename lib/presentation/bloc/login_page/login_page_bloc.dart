import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<OtpButtonColorEvent>((event, emit) {
      if(event.number.length==13){
        emit(OtpButtonColorState(color: Colors.greenAccent,phone: event.number));
      }else{
        emit(OtpButtonColorState(color: Colors.white,phone: event.number));
      }
    });
  }
}
