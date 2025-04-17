part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthVerifyLoadingState extends AuthState{}
class AuthVerifySuccessState extends AuthState{
  final String phone;
  final String verificationId;
  AuthVerifySuccessState({required this.phone,required this.verificationId});
}