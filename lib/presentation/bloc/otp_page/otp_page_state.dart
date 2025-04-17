part of 'otp_page_bloc.dart';

@immutable
sealed class OtpPageState {}

final class OtpPageInitial extends OtpPageState {}
class OtpVerifyLoadingState extends OtpPageState{}

class OtpVerifiedState extends OtpPageState{}