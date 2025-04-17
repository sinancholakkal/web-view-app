import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:web_view_app/presentation/pages/screen_home/screen_home.dart';
import 'package:web_view_app/widget/flutter_toast.dart';
import 'package:web_view_app/widget/loading_widget.dart';
import 'package:web_view_app/widget/text_widget.dart';

class ScreenOtp extends StatefulWidget {
  ScreenOtp({super.key, required this.phone, required this.verificationId});
  final String phone;
  final String verificationId;
  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  late PincodeInputFieldsController _controller;

  @override
  void initState() {
    _controller = PincodeInputFieldsController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpPageBloc, OtpPageState>(
        listener: (context, state) async {
          if (state is OtpVerifyLoadingState) {
            loadingWidget(context);
          }
          else if (state is OtpVerifiedState) {
           Get.offAll(()=> ScreenHome());
          
          }else if(state is OtpVerifyErrorState){
            log("erro state exicuted");
            Get.back();
            flutterToast(msg: "Please enter the valide OTP");
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH50,
                const TextWidget(
                  text: "OTP",
                  size: 38,
                  fontWeight: FontWeight.w400,
                ),
                const TextWidget(
                  text: "Verification",
                  size: 38,
                  fontWeight: FontWeight.w700,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: "Enter the OTP sent to ",
                      size: 16,
                      color: Color.fromARGB(255, 135, 135, 135),
                    ),
                    TextWidget(
                      text:
                          "${widget.phone.substring(0, 8)}****${widget.phone[widget.phone.length - 1]}",
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                sizedBoxH50,
                Center(
                  child: PincodeInputFields(
                    length: 6,
                    heigth: 60,
                    width: 60,
                    autoFocus: true,
                    controller: _controller,
                    onChanged: (value) {
                      log(value);
                      if (value.length == 6) {
                        log("call next");
                        context
                            .read<OtpPageBloc>()
                            .add(OtpEnteredEvent(otp: value,verificationId: widget.verificationId));
                      }
                    },
                  ),
                ),
                sizedBoxH50,
                Center(
                    child: TextWidget(
                  text: "Didn't you receive any code?",
                  color: Colors.red[400],
                  size: 15,
                )),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: "RESEND NEW CODE",
                    color: Colors.red,
                    size: 15,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
