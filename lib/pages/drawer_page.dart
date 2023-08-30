import 'dart:ffi';

import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final String title;
  const DrawerPage({super.key, required this.title});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0  Home', style: optionStyle),
    Text('Index 1  Business', style: optionStyle),
    Text('Index 2  School', style: optionStyle),
  ];
  void _itemOnTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Divider(height: 20),
          const Text(
            '点击右上角的按钮会出现一个抽屉的效果',
            style: TextStyle(fontSize: 20),
          ),
          const Divider(height: 20),
          _widgetOptions[_selectedIndex],
          const Divider(height: 20),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'key：唯一标识\nelevation：设置抽屉的阴影效果\nshadowColor：设置抽屉周围阴影的颜色\nsurfaceTintColor：指定抽屉的表面（surface）的着色颜色\nshape：用于定义抽屉的形状\nsemanticLabel：为抽屉提供语义化的标签，以便屏幕阅读器或辅助功能可以正确地描述和标识抽屉。该属性接受一个字符串值，用于描述抽屉的内容或用途',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/image1.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                'Drawer heading',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              title: _widgetOptions[0],
              selected: _selectedIndex == 0,
              onTap: () {
                _itemOnTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: _widgetOptions[1],
              selected: _selectedIndex == 1,
              onTap: () {
                _itemOnTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: _widgetOptions[2],
              selected: _selectedIndex == 2,
              onTap: () {
                _itemOnTap(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      onEndDrawerChanged: (isOpen) {
        print(isOpen ? '抽屉打开了' : '抽屉关闭了');
      },
    );
  }
}
