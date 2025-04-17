import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:web_view_app/core/colors.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:web_view_app/presentation/bloc/login_page/login_page_bloc.dart';
import 'package:web_view_app/presentation/pages/screen_otp/screen_otp.dart';
import 'package:web_view_app/widget/loading_widget.dart';
import 'package:web_view_app/widget/my_button.dart';

class OtpButtonSection extends StatelessWidget {
  const OtpButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return bloc.BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthVerifyLoadingState){
          loadingWidget(context);
        }else if(state is AuthVerifySuccessState){
          Get.off(
                        () => ScreenOtp(
                              phone: state.phone,
                              verificationId: state.verificationId,
                            ),
                        transition: Transition.leftToRight);
        }
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            sizedBoxH20,
            bloc.BlocBuilder<LoginPageBloc, LoginPageState>(
              builder: (context, state) {
                Color color = Colors.white;
                String? phone;
                if (state is OtpButtonColorState) {
                  color = state.color;
                  phone = state.phone;
                }
                return MyBottonWidget(
                  color: color,
                  text: "Send OTP",
                  onTap: () async {
                    //log(phone!.length.toString());
                    if (phone != null && phone.length == 13) {
                      log(phone.length.toString());
                      log(phone.toString());
                      context
                          .read<AuthBloc>()
                          .add(VerifyPhoneNumberEvent(phone: phone));
                    }
                  },
                );
              },
            ),
            sizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: grey500,
                  ),
                ),
                Text(
                  "Register now",
                  style: TextStyle(fontWeight: FontWeight.bold, color: grey500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
