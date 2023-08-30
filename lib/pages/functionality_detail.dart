import 'package:flutter/material.dart';

class FunctionalityDetailPage extends StatelessWidget {
  final String title;
  const FunctionalityDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
