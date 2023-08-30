import 'package:flutter/material.dart';
import 'package:flutter_study/pages/layout_ui_detail.dart';

class LayoutUIPage extends StatefulWidget {
  final String title;
  const LayoutUIPage({super.key, required this.title});

  @override
  State<LayoutUIPage> createState() => _LayoutUIPageState();
}

class _LayoutUIPageState extends State<LayoutUIPage> {
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
      children: List.generate(_generateItems.length, (indexPage) {
        return ExpansionPanelRadio(
          canTapOnHeader: true,
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
          value: _generateItems[indexPage]['headerValue'],
        );
      }),
    );
  }
}

List _generateItems = [
  {
    "headerValue": '布局原理与约束(Constraints)',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'BoxConstraints',
        'page': const LayoutUIDetailPage(title: 'BoxConstraints'),
      },
      {
        'title': 'ConstrainedBox',
        'page': const LayoutUIDetailPage(title: 'ConstrainedBox'),
      },
      {
        'title': 'BoxConstraints',
        'page': const LayoutUIDetailPage(title: 'BoxConstraints'),
      },
      {
        'title': 'SizedBox',
        'page': const LayoutUIDetailPage(title: 'SizedBox'),
      },
      {
        'title': '多重限制',
        'page': const LayoutUIDetailPage(title: '多重限制'),
      },
      {
        'title': 'UnconstrainedBox',
        'page': const LayoutUIDetailPage(title: 'UnconstrainedBox'),
      },
    ],
  },
  {
    "headerValue": '线性布局(Row和Column)',
    'isExpanded': false,
    'contentList': [
      {
        'title': '主轴和纵轴',
        'page': const LayoutUIDetailPage(title: '主轴和纵轴'),
      },
      {
        'title': 'Row',
        'page': const LayoutUIDetailPage(title: 'Row'),
      },
      {
        'title': 'Column',
        'page': const LayoutUIDetailPage(title: 'Column'),
      },
      {
        'title': '特殊情况',
        'page': const LayoutUIDetailPage(title: '特殊情况'),
      },
    ],
  },
  {
    "headerValue": '弹性布局(Flex)',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Flex',
        'page': const LayoutUIDetailPage(title: 'Flex'),
      },
      {
        'title': 'Expanded',
        'page': const LayoutUIDetailPage(title: 'Expanded'),
      },
    ],
  },
  {
    "headerValue": '流式布局(Wrap和Flow)',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Wrap',
        'page': const LayoutUIDetailPage(title: 'Wrap'),
      },
      {
        'title': 'Flow',
        'page': const LayoutUIDetailPage(title: 'Flow'),
      },
    ],
  },
  {
    "headerValue": '层叠布局(Stack、Positioned)',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Stack',
        'page': const LayoutUIDetailPage(title: 'Stack'),
      },
      {
        'title': 'Positioned',
        'page': const LayoutUIDetailPage(title: 'Positioned'),
      },
    ],
  },
  {
    "headerValue": '对齐与相对定位（Align）',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Align',
        'page': const LayoutUIDetailPage(title: 'Align'),
      },
      {
        'title': 'Align和Stack对比',
        'page': const LayoutUIDetailPage(title: 'Align和Stack对比'),
      },
      {
        'title': 'Center组件',
        'page': const LayoutUIDetailPage(title: 'Center'),
      },
    ],
  },
  {
    "headerValue": 'LayoutBuilder、AfterLayout',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'LayoutBuilder',
        'page': const LayoutUIDetailPage(title: 'LayoutBuilder'),
      },
      {
        'title': 'AfterLayout',
        'page': const LayoutUIDetailPage(title: 'AfterLayout'),
      },
      {
        'title': 'Flutter 的 build 和 layout',
        'page': const LayoutUIDetailPage(title: 'Flutter 的 build 和 layout'),
      },
    ],
  },
];
