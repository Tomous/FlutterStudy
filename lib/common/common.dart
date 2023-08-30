import 'package:flutter/material.dart';

TextStyle titleStyle() {
  return const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

TextStyle subTitleStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
}

TextSpan textSpanTitleAndSubTitle(String title, String subTitle) {
  return TextSpan(
    children: [
      TextSpan(
        text: title.contains('：') ? title : '$title：',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: subTitle,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ],
  );
}
