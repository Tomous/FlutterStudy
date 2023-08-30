import 'package:flutter/material.dart';

class MaterialAppPage extends StatelessWidget {
  const MaterialAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App'),
        ),
        body: const Center(
            child: Text(
          '这是一个Material App\n侧滑可以返回',
          style: TextStyle(fontSize: 20, color: Colors.black45),
        )),
      ),
    );
  }
}
