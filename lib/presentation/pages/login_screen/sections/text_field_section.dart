
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:web_view_app/presentation/bloc/login_page/login_page_bloc.dart';

class TextFiledSection extends StatelessWidget {
  const TextFiledSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
            borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        context
            .read<LoginPageBloc>()
            .add(OtpButtonColorEvent(number: phone.completeNumber));
        print(phone.completeNumber);
      },
    );
  }
}
