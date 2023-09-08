import 'package:flutter/material.dart';
import 'package:flutter_study/pages/variable_detail.dart';

class VariablePage extends StatefulWidget {
  final String title;
  const VariablePage({super.key, required this.title});

  @override
  State<VariablePage> createState() => _VariablePageState();
}

class _VariablePageState extends State<VariablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildExpansionPanel(),
        ),
      ),
    );
  }

  Widget _buildExpansionPanel() {
    return ExpansionPanelList.radio(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _generateItems[panelIndex]['isExpanded'] = !isExpanded;
        });
      },
      children: List.generate(
        _generateItems.length,
        (indexPage) {
          return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: _generateItems[indexPage],
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  _generateItems[indexPage]['headerValue'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _generateItems[indexPage]['contentList'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _generateItems[indexPage]['contentList'][index]['title'],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _generateItems[indexPage]
                              ['contentList'][index]['page']),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

List _generateItems = [
  {
    "headerValue": '可滚动组件简介',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Sliver布局模型',
        'page': const VariableDetailPage(title: 'Sliver'),
      },
      {
        'title': 'Scrollable',
        'page': const VariableDetailPage(title: 'Scrollable'),
      },
      {
        'title': 'Viewport',
        'page': const VariableDetailPage(title: 'Viewport'),
      },
      {
        'title': '可滚动组件的通用配置',
        'page': const VariableDetailPage(title: '可滚动组件的通用配置'),
      },
      {
        'title': 'ScrollController',
        'page': const VariableDetailPage(title: 'ScrollController'),
      },
      {
        'title': '子节点缓存',
        'page': const VariableDetailPage(title: '子节点缓存'),
      },
      {
        'title': 'Scrollbar',
        'page': const VariableDetailPage(title: 'Scrollbar'),
      },
    ],
  },
  {
    "headerValue": 'SingleChildScrollView',
    'isExpanded': false,
    'contentList': [
      {
        'title': '简介',
        'page': const VariableDetailPage(title: '简介'),
      },
      {
        'title': '实例',
        'page': const VariableDetailPage(title: '实例'),
      },
    ],
  },
  {
    "headerValue": 'ListView',
    'isExpanded': false,
    'contentList': [
      {
        'title': '默认构造函数',
        'page': const VariableDetailPage(title: '默认构造函数'),
      },
      {
        'title': 'ListView.builder',
        'page': const VariableDetailPage(title: 'ListView.builder'),
      },
      {
        'title': 'ListView.separated',
        'page': const VariableDetailPage(title: 'ListView.separated'),
      },
      {
        'title': '固定高度列表',
        'page': const VariableDetailPage(title: '固定高度列表'),
      },
      {
        'title': 'ListView 原理',
        'page': const VariableDetailPage(title: 'ListView 原理'),
      },
      {
        'title': '实例：无限加载列表',
        'page': const VariableDetailPage(title: '无限加载列表'),
      },
    ],
  },
  {
    "headerValue": '滚动监听及控制',
    'isExpanded': false,
    'contentList': [
      {
        'title': '滚动监听及控制',
        'page': const VariableDetailPage(title: '滚动监听及控制'),
      },
      {
        'title': '滚动监听',
        'page': const VariableDetailPage(title: '滚动监听'),
      },
    ],
  },
  {
    "headerValue": 'AnimatedList',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'AnimatedList',
        'page': const VariableDetailPage(title: 'AnimatedList'),
      },
    ],
  },
  {
    "headerValue": 'GridView',
    'isExpanded': false,
    'contentList': [
      {
        'title': '默认构造函数',
        'page': const VariableDetailPage(title: '默认构造函数'),
      },
      {
        'title': 'GridView.count',
        'page': const VariableDetailPage(title: 'GridView.count'),
      },
      {
        'title': 'GridView.extent',
        'page': const VariableDetailPage(title: 'GridView.extent'),
      },
      {
        'title': 'GridView.builder',
        'page': const VariableDetailPage(title: 'GridView.builder'),
      },
    ],
  },
  {
    "headerValue": 'PageView与页面缓存',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'PageView',
        'page': const VariableDetailPage(title: 'PageView'),
      },
      {
        'title': '页面缓存',
        'page': const VariableDetailPage(title: '页面缓存'),
      },
    ],
  },
  {
    "headerValue": '可滚动组件子项缓存',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'AutomaticKeepAlive',
        'page': const VariableDetailPage(title: 'AutomaticKeepAlive'),
      },
      {
        'title': 'KeepAliveWrapper',
        'page': const VariableDetailPage(title: 'KeepAliveWrapper'),
      },
    ],
  },
  {
    "headerValue": 'TabBarView',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'TabBarView',
        'page': const VariableDetailPage(title: 'TabBarView'),
      },
      {
        'title': 'TabBar',
        'page': const VariableDetailPage(title: 'TabBar'),
      },
      {
        'title': '实例',
        'page': const VariableDetailPage(title: '实例'),
      },
    ],
  },
  {
    "headerValue": 'CustomScrollView 和 Slivers',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'CustomScrollView',
        'page': const VariableDetailPage(title: 'CustomScrollView'),
      },
      {
        'title': 'Flutter 中常用的 Sliver',
        'page': const VariableDetailPage(title: 'Flutter 中常用的 Sliver'),
      },
    ],
  },
  {
    "headerValue": '自定义 Sliver',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Sliver 布局协议',
        'page': const VariableDetailPage(title: 'Sliver 布局协议'),
      },
      {
        'title': 'SliverFlexibleHeader',
        'page': const VariableDetailPage(title: 'SliverFlexibleHeader'),
      },
      {
        'title': 'SliverPersistentHeaderToBox',
        'page': const VariableDetailPage(title: 'SliverPersistentHeaderToBox'),
      },
    ],
  },
  {
    "headerValue": '嵌套可滚动组件 NestedScrollView',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'NestedScrollView',
        'page': const VariableDetailPage(title: 'NestedScrollView'),
      },
      {
        'title': 'NestedScrollView 原理',
        'page': const VariableDetailPage(title: 'NestedScrollView 原理'),
      },
      {
        'title': 'SliverAppBar',
        'page': const VariableDetailPage(title: 'SliverAppBar'),
      },
      {
        'title': '嵌套 TabBarView',
        'page': const VariableDetailPage(title: '嵌套 TabBarView'),
      },
    ],
  },
];
