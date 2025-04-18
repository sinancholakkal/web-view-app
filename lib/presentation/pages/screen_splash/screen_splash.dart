import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:web_view_app/presentation/pages/login_screen/login_page.dart';
import 'package:web_view_app/presentation/pages/screen_home/screen_home.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    splashingTiming();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("asset/splash-animation.json",animate: true),
      ),
    );
  }
  Future<void>splashingTiming()async{
    final user = FirebaseAuth.instance.currentUser;
    
    await Future.delayed(const Duration(milliseconds: 3000));
    if(user==null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ScreenLogin()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ScreenHome()));
    }
    
  }
}