import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_view_app/presentation/pages/login_screen/login_page.dart';
import 'package:web_view_app/presentation/pages/screen_home/screen_home.dart';
import 'package:web_view_app/widget/text_widget.dart';

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
        child: TextWidget(text: "Loading"),
      ),
    );
  }
  Future<void>splashingTiming()async{
    final user = FirebaseAuth.instance.currentUser;
    
    await Future.delayed(Duration(milliseconds: 2500));
    if(user==null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenLogin()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenHome()));
    }
    
  }
}