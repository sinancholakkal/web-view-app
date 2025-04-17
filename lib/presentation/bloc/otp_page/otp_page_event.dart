part of 'otp_page_bloc.dart';

@immutable
sealed class OtpPageEvent {}
 class OtpEnteredEvent extends OtpPageEvent{
  final String otp;
  OtpEnteredEvent({required this.otp});
 }