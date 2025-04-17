import 'package:flutter/material.dart';
import 'package:web_view_app/core/constent.dart';
import 'package:web_view_app/widget/text_widget.dart';

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
