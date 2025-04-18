import 'package:flutter/material.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/presentation/pages/screen_otp/screen_otp.dart';
import 'package:web_view_app/widget/text_widget.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.widget,
  });

  final ScreenOtp widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
        ],
      ),
    );
  }
}
