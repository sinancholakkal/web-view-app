part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class VerifyPhoneNumberEvent extends AuthEvent{
  final String phone;
  VerifyPhoneNumberEvent({required this.phone});
}
class OtpCodeSentEvent extends AuthEvent {
  final String phone;
  final String verificationId;

  OtpCodeSentEvent({required this.phone, required this.verificationId});
}
