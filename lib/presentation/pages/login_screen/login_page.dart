import 'package:flutter/material.dart';
import 'package:web_view_app/core/colors.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/image_section.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/init_text_section.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/otp_button_section.dart';
import 'package:web_view_app/presentation/pages/login_screen/sections/text_field_section.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image session
                 ImageSession(),
                //Const text section
                 InitTextSection(),
                //Text field section
                TextFiledSection(),
                //Otp button section
                OtpButtonSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



