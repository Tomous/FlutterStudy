import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  final String title;
  const ListViewPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('listView'),
      ),
    );
  }
}
