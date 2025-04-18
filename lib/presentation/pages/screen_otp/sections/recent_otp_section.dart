import 'package:flutter/material.dart';
import 'package:otp_resend_timer/otp_resend_timer.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/widget/text_widget.dart';

class RecentOtpSection extends StatelessWidget {
  RecentOtpSection({
    super.key,
  });
  final controller = OtpResendTimerController(initialTime: 60);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBoxH50,
          Center(
              child: TextWidget(
            text: "Didn't you receive any code?",
            color: Colors.red[400],
            size: 15,
          )),
          sizedBoxH10,
          OtpResendTimer(
              controller: controller,

              readyMessageStyle: TextStyle(
                fontSize: 14
              ),
              autoStart: true,
              timerMessage: "Resend OTP in ",
              readyMessage: "You can now resend the code",
              onFinish: () {},
              onResendClicked: () {},
              onStart: () {}),
          // Center(
          //     child: TextButton(
          //   onPressed: () {},
          //   child: const TextWidget(
          //     text: "RESEND NEW CODE",
          //     color: Colors.red,
          //     size: 15,
          //   ),
          // ))
        ],
      ),
    );
  }
}
