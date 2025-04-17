import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:web_view_app/core/colors.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/otp_button_section.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/text_field_section.dart';
import 'package:web_view_app/widget/text_widget.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image session
                const ImageSession(),
                //Const text section
                const InitTextSection(),
                //Text field section
                TextFiledSection(),
                OtpButtonSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class InitTextSection extends StatelessWidget {
  const InitTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Mobile number,",
                size: 38,
                fontWeight: FontWeight.w400,
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: "Please",
                size: 38,
                fontWeight: FontWeight.w700,
              )),
          sizedBoxH20,
        ],
      ),
    );
  }
}

class ImageSession extends StatelessWidget {
  const ImageSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 200,
            child: Image.asset(
              "asset/Screenshot 2025-04-17 105416.png",
            ),
          ),
          const SizedBox(
            height: 140,
          ),
        ],
      ),
    );
  }
}
