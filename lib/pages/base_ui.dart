import 'package:flutter/material.dart';
import 'package:flutter_study/pages/base_ui_detail.dart';

class BaseUIPage extends StatelessWidget {
  final String title;
  const BaseUIPage({super.key, this.title = 'Base UI'});

  static const List _itemList = [
    {
      "title": '文本样式-Text',
      'page': BaseUIDetailPage(title: '文本样式-Text'),
    },
    {
      "title": '按钮-Button',
      'page': BaseUIDetailPage(title: '按钮-Button'),
    },
    {
      "title": '图片及Icon',
      'page': BaseUIDetailPage(title: '图片及Icon'),
    },
    {
      "title": '单选开关和复选框',
      'page': BaseUIDetailPage(title: '单选开关和复选框'),
    },
    {
      "title": '输入框及表单',
      'page': BaseUIDetailPage(title: '输入框及表单'),
    },
    {
      "title": '进度指示器',
      'page': BaseUIDetailPage(title: '进度指示器'),
    },
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
