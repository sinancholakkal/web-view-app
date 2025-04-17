
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'otp_page_event.dart';
part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, OtpPageState> {
  OtpPageBloc() : super(OtpPageInitial()) {
    on<OtpEnteredEvent>((event, emit) async{
      emit(OtpVerifyLoadingState());
     try{
       PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: event.verificationId, smsCode: event.otp);
                 final UserCredential user= await FirebaseAuth.instance.signInWithCredential(credential);
     emit(OtpVerifiedState());
     }catch(e){
      emit(OtpVerifyErrorState());
      log("Something wrong while veryfy otp $e");
     }
    });
  }
}
