import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final String title;
  const GridViewPage({super.key, required this.title});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          21,
          (index) {
            return Center(
              child: Image.asset('assets/images/image3.jpeg'),
            );
          },
        ),
      ),
    );
  }
}
