import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_view_app/widget/alert_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:web_view_app/presentation/pages/login_screen/login_page.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev/showcase'));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
    onPopInvoked: (didPop) async {
      if (didPop) return;

      if (await webViewController.canGoBack()) {
        webViewController.goBack();
      } else {
        Navigator.of(context).maybePop(); 
      }
    },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        
        body: SafeArea(child: WebViewWidget(controller: webViewController)),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            log("ontap called");
            alertWidget(title: "Logout", content: "Are you sure want to logout now?",onTap: ()async{
              await FirebaseAuth.instance.signOut();
            Get.off(() => const ScreenLogin());
            },context: context);
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}