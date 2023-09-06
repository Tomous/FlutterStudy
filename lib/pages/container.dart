import 'package:flutter/material.dart';
import 'package:flutter_study/pages/container_detail.dart';

class ContainerPage extends StatelessWidget {
  final String title;
  const ContainerPage({super.key, required this.title});

  static const List _itemList = [
    {
      'title': '页面骨架（Scaffold）',
      'page': ContainerDetailPage(title: 'Scaffold'),
    },
    {
      "title": '填充（Padding）',
      'page': ContainerDetailPage(title: 'Padding'),
    },
    {
      "title": '装饰容器（DecoratedBox）',
      'page': ContainerDetailPage(title: 'DecoratedBox'),
    },
    {
      "title": '变换（Transform）',
      'page': ContainerDetailPage(title: 'Transform'),
    },
    {
      "title": '容器组件（Container）',
      'page': ContainerDetailPage(title: 'Container'),
    },
    {
      "title": '剪裁（Clip）',
      'page': ContainerDetailPage(title: 'Clip'),
    },
    {
      "title": '空间适配（FittedBox）',
      'page': ContainerDetailPage(title: 'FittedBox'),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: List.generate(
          _itemList.length,
          (index) {
            return ListTile(
              title: Text(
                _itemList[index]['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _itemList[index]['page'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
