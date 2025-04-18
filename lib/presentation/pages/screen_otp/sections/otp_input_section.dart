import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';
import 'package:web_view_app/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:web_view_app/presentation/pages/screen_otp/screen_otp.dart';

class OtpIputSection extends StatelessWidget {
  const OtpIputSection({
    super.key,
    required PincodeInputFieldsController controller,
    required this.widget,
  }) : _controller = controller;

  final PincodeInputFieldsController _controller;
  final ScreenOtp widget;

  @override
  Widget build(BuildContext context) {
    return Center(
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
            context.read<OtpPageBloc>().add(OtpEnteredEvent(
                otp: value, verificationId: widget.verificationId));
          }
        },
      ),
    );
  }
}
