import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_view_app/widget/text_widget.dart';

 alertWidget({required BuildContext context, required String title,required String content,void Function()? onTap}){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: TextWidget(text: title),
      content: TextWidget(text: content),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const TextWidget(text: "No")),
        TextButton(onPressed: onTap, child: const TextWidget(text: "Yes"))
      ],
    );
  });
}