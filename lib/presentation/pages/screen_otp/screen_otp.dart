import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:web_view_app/presentation/pages/screen_home/screen_home.dart';
import 'package:web_view_app/presentation/pages/screen_otp/sections/otp_input_section.dart';
import 'package:web_view_app/presentation/pages/screen_otp/sections/recent_otp_section.dart';
import 'package:web_view_app/presentation/pages/screen_otp/sections/text_session.dart';
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
           Get.offAll(()=> const ScreenHome());
          
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
                //Const text and displaying some part of mobile number
                TextSection(widget: widget),
                //Otp input section--------------
                OtpIputSection(controller: _controller, widget: widget),
                //Resent otp section
                 RecentOtpSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


