import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/pages/animation_detail.dart';

class AnimationPage extends StatefulWidget {
  final String title;
  const AnimationPage({super.key, required this.title});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  static const List _itemList = [
    {
      "title": 'Flutter动画简介',
      'page': AnimationDetailPage(title: 'Flutter动画简介'),
    },
    {
      "title": '动画基本结构及状态监听',
      'page': AnimationDetailPage(title: '动画基本结构及状态监听'),
    },
    {
      "title": '自定义路由切换动画',
      'page': AnimationDetailPage(title: '自定义路由切换动画'),
    },
    {
      "title": 'Hero动画',
      'page': AnimationDetailPage(title: 'Hero动画'),
    },
    {
      "title": '交织动画',
      'page': AnimationDetailPage(title: '交织动画'),
    },
    {
      "title": '动画切换组件',
      'page': AnimationDetailPage(title: '动画切换组件'),
    },
    {
      "title": '动画过渡组件',
      'page': AnimationDetailPage(title: '动画过渡组件'),
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
            title: Text(
              _itemList[index]['title'],
              style: titleStyle(),
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
    );
  }
}
