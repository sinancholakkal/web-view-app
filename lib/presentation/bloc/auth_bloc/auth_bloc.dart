import 'dart:developer';

import 'package:bloc/bloc.dart'as bloc;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:web_view_app/presentation/pages/screen_otp/screen_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends bloc.Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<VerifyPhoneNumberEvent>((event, emit)async {
      emit(AuthVerifyLoadingState());
      try{
        await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (PhoneAuthCredential credential){},
                      verificationFailed: (FirebaseAuthException ex){
                        log(ex.toString());
                      },
                      codeSent: (String verificationId, int? recenttoken){
                        add(OtpCodeSentEvent(phone: event.phone, verificationId: verificationId));
                        //emit(AuthVerifySuccessState(phone: event.phone, verificationId: verificationId));
                        
                      },
                      codeAutoRetrievalTimeout: (String verificationId){},
                      phoneNumber: event.phone,
                    );
      }catch(e){
        log("Something issue while verify phone number");
      }
    });

    on<OtpCodeSentEvent>((event, emit) {
  emit(AuthVerifySuccessState(phone: event.phone, verificationId: event.verificationId));
});
  }
}
