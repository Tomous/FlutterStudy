import 'package:flutter/material.dart';
import 'package:flutter_study/pages/functionality_detail.dart';

class FunctionalityPage extends StatefulWidget {
  final String title;
  const FunctionalityPage({super.key, required this.title});

  @override
  State<FunctionalityPage> createState() => _FunctionalityPageState();
}

class _FunctionalityPageState extends State<FunctionalityPage> {
  final List _itemList = [
    {
      'title': '导航返回拦截（WillPopScope）',
      'page': const FunctionalityDetailPage(title: 'WillPopScope'),
    },
    {
      'title': '数据共享（InheritedWidget）',
      'page': const FunctionalityDetailPage(title: 'InheritedWidget'),
    },
    {
      'title': '跨组件状态共享',
      'page': const FunctionalityDetailPage(title: '跨组件状态共享'),
    },
    {
      'title': '颜色和主题',
      'page': const FunctionalityDetailPage(title: '颜色和主题'),
    },
    {
      'title': '按需rebuild（ValueListenableBuilder）',
      'page': const FunctionalityDetailPage(title: 'ValueListenableBuilder'),
    },
    {
      'title': '异步UI更新（FutureBuilder、StreamBuilder）',
      'page':
          const FunctionalityDetailPage(title: 'FutureBuilder、StreamBuilder'),
    },
    {
      'title': '对话框详解',
      'page': const FunctionalityDetailPage(title: '对话框详解'),
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
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _itemList[index]['title'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          }),
    );
  }
}
