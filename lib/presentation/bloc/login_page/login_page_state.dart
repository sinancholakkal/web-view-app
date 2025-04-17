part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageState {}

final class LoginPageInitial extends LoginPageState {}

class OtpButtonColorState extends LoginPageState{
  final Color color;
  final String phone;
  OtpButtonColorState({required this.color,required this.phone});
}