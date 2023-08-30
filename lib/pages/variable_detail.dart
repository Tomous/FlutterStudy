import 'package:flutter/material.dart';

class VariableDetailPage extends StatelessWidget {
  final String title;
  const VariableDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
