
import 'package:flutter/material.dart';

class MyBottonWidget extends StatelessWidget {
  String text;
  void Function()? onTap;
  final Color color;
   MyBottonWidget({super.key,required this.text,required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color: color,
          borderRadius: BorderRadius.circular(10),
        
        ),
        padding: EdgeInsets.all(14),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}