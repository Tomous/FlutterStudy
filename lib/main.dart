import 'package:flutter/material.dart';
import 'package:flutter_study/pages/base_ui.dart';
import 'package:flutter_study/pages/container.dart';
import 'package:flutter_study/pages/event_handling.dart';
import 'package:flutter_study/pages/functionality.dart';
import 'package:flutter_study/pages/gridView_page.dart';
import 'package:flutter_study/pages/layout_ui.dart';
import 'package:flutter_study/pages/listView_page.dart';
import 'package:flutter_study/pages/materialApp_page.dart';
import 'package:flutter_study/pages/column_row_page.dart';
import 'package:flutter_study/pages/un_material_app_page.dart';
import 'package:flutter_study/pages/variable.dart';
import 'pages/drawer_page.dart';

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
    Text('Material App', style: optionStyle),
    Text('unMaterial App', style: optionStyle),
    Text('Column and Row', style: optionStyle),
    Text('ListView', style: optionStyle),
    Text('GridView', style: optionStyle),
    Text('Drawer', style: optionStyle),
  ];
  //对应的跳转页面
  static const List<Widget> _pageList = <Widget>[
    BaseUIPage(title: '基础组件'),
    LayoutUIPage(title: '布局类组件'),
    ContainerPage(title: '容器类组件'),
    VariablePage(title: '可滚动组件'),
    FunctionalityPage(title: '功能型组件'),
    EventHandlingPage(title: '事件处理与通知'),
    MaterialAppPage(),
    UnMaterialAppPage(),
    ColumnRowPage(title: 'Column and Row'),
    ListViewPage(
      title: 'ListView',
    ),
    GridViewPage(title: 'GridView'),
    DrawerPage(
      title: 'Drawer',
    ),
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
        appBar: AppBar(title: const Text('Home')),
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