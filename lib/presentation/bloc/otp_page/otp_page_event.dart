part of 'otp_page_bloc.dart';

@immutable
sealed class OtpPageEvent {}
 class OtpEnteredEvent extends OtpPageEvent{
  final String otp;
  final String verificationId;
  OtpEnteredEvent({required this.otp,required this.verificationId});
 }