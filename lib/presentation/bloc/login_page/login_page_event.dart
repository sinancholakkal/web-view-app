part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageEvent {}

class OtpButtonColorEvent extends LoginPageEvent{
  final String number;
  OtpButtonColorEvent({required this.number});
}
