
import 'package:flutter/material.dart';

class ImageSession extends StatelessWidget {
  const ImageSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 200,
            child: Image.asset(
              "asset/Screenshot 2025-04-17 105416.png",
            ),
          ),
          const SizedBox(
            height: 140,
          ),
        ],
      ),
    );
  }
}
