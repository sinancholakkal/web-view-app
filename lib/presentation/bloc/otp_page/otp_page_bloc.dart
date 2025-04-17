import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_page_event.dart';
part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, OtpPageState> {
  OtpPageBloc() : super(OtpPageInitial()) {
    on<OtpEnteredEvent>((event, emit) async{
      emit(OtpVerifyLoadingState());
      await Future.delayed(Duration(seconds: 2));
      emit(OtpVerifiedState());
    });
  }
}
