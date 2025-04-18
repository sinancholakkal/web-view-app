import 'package:flutter/material.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/widget/text_widget.dart';

class RecentOtpSection extends StatelessWidget {
  const RecentOtpSection({
    super.key,
  });

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
    Center(
        child: TextButton(
      onPressed: () {},
      child: const TextWidget(
        text: "RESEND NEW CODE",
        color: Colors.red,
        size: 15,
      ),
    ))
        ],
      ),
    );
  }
}
