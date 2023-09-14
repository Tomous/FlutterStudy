import 'package:flutter/material.dart';
import 'package:flutter_study/goodHouseApp/pages/login.dart';
import 'package:flutter_study/packaging/http_client.dart';
import 'package:flutter_study/pages/animation.dart';
import 'package:flutter_study/pages/base_ui.dart';
import 'package:flutter_study/pages/container.dart';
import 'package:flutter_study/pages/custom_widget.dart';
import 'package:flutter_study/pages/event_handling.dart';
import 'package:flutter_study/pages/functionality.dart';
import 'package:flutter_study/pages/layout_ui.dart';
import 'package:flutter_study/pages/column_row_page.dart';
import 'package:flutter_study/pages/variable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; //当前选中的行
  //设置字体样式
  static const optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  //每行的字体
  static const List<Widget> _itemTitleList = [
    Text('基础组件', style: optionStyle),
    Text('布局类组件', style: optionStyle),
    Text('容器类组件', style: optionStyle),
    Text('可滚动组件', style: optionStyle),
    Text('功能型组件', style: optionStyle),
    Text('事件处理与通知', style: optionStyle),
    Text('Flutter动画简介', style: optionStyle),
    Text('自定义组件', style: optionStyle),
    Text('文件操作与网络请求', style: optionStyle),
    Text('Column and Row', style: optionStyle),
    Text('好客房APP', style: optionStyle),
  ];
  //对应的跳转页面
  static const List<Widget> _pageList = <Widget>[
    BaseUIPage(title: '基础组件'),
    LayoutUIPage(title: '布局类组件'),
    ContainerPage(title: '容器类组件'),
    VariablePage(title: '可滚动组件'),
    FunctionalityPage(title: '功能型组件'),
    EventHandlingPage(title: '事件处理与通知'),
    AnimationPage(title: 'Flutter动画简介'),
    CustomWidgetPage(title: '自定义组件'),
    HttpClientPage(title: '文件操作与网络请求'),
    ColumnRowPage(title: 'Column and Row'),
    LoginPage(),
  ];

//点击ListTile的时候把当前行号赋值给选中的行号
  void _itemOnTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homedddd',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
          itemCount: _itemTitleList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: _itemTitleList[index],
              selected: _selectedIndex == index,
              onTap: () {
                _itemOnTap(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _pageList[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
