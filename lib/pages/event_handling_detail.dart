import 'package:flutter/material.dart';

class EventHandlingDetailPage extends StatelessWidget {
  final String title;
  const EventHandlingDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
