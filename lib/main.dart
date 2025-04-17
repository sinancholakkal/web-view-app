
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:web_view_app/firebase_options.dart';
import 'package:web_view_app/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:web_view_app/presentation/bloc/login_page/login_page_bloc.dart';
import 'package:web_view_app/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:web_view_app/presentation/pages/login_screen/login_page.dart';
import 'package:web_view_app/presentation/pages/screen_splash/screen_splash.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(create: (context)=>AuthBloc())
      ],
      child: GetMaterialApp(
        home: ScreenSplash(),
      ),
    );
  }
}
