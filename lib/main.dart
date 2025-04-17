
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:web_view_app/presentation/bloc/login_page/login_page_bloc.dart';
import 'package:web_view_app/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:web_view_app/presentation/pages/login_screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginPageBloc(),
        ),
        BlocProvider(
          create: (context) => OtpPageBloc(),
        ),
      ],
      child: GetMaterialApp(
        home: ScreenLogin(),
      ),
    );
  }
}
