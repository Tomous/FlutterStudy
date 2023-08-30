import 'package:flutter/material.dart';

class UnMaterialAppPage extends StatelessWidget {
  const UnMaterialAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
          child: Text(
        '这是一个非Material App\n侧滑可以返回',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87,
        ),
      )),
    );
  }
}
