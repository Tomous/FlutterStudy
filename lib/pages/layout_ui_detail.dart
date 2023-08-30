import 'package:flutter/material.dart';

class LayoutUIDetailPage extends StatelessWidget {
  final String title;
  const LayoutUIDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
