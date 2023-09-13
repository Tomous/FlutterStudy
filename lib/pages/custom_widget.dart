import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/custom_widget_detail.dart';

class CustomWidgetPage extends StatefulWidget {
  final String title;
  const CustomWidgetPage({super.key, required this.title});

  @override
  State<CustomWidgetPage> createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {
  static const List _itemList = [
    {
      "title": '自定义组件方法简介',
      'page': CustomWidgetDetailPage(title: '自定义组件方法简介'),
    },
    {
      "title": '组合现有组件',
      'page': CustomWidgetDetailPage(title: '组合现有组件'),
    },
    {
      "title": '组合实例：TurnBox',
      'page': CustomWidgetDetailPage(title: '组合实例：TurnBox'),
    },
    {
      "title": 'CustomPaint 与 Canvas',
      'page': CustomWidgetDetailPage(title: 'CustomPaint 与 Canvas'),
    },
    {
      "title": '自绘实例：圆形背景渐变进度条',
      'page': CustomWidgetDetailPage(title: '自绘实例：圆形背景渐变进度条'),
    },
    {
      "title": '自绘组件：CustomCheckbox',
      'page': CustomWidgetDetailPage(title: '自绘组件：CustomCheckbox'),
    },
    {
      "title": '自绘组件: DoneWidget',
      'page': CustomWidgetDetailPage(title: '自绘组件: DoneWidget'),
    },
    {
      "title": '水印实例',
      'page': CustomWidgetDetailPage(title: '水印实例'),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _itemList.length,
        itemExtent: 56.0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_itemList[index]['title']),
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => _itemList[index]['page'],
              ),
            ),
          );
        },
      ),
    );
  }
}
