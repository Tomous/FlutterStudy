import 'package:flutter/material.dart';

class ContainerDetailPage extends StatelessWidget {
  final String title;
  const ContainerDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
