import 'package:flutter/material.dart';
import 'package:flutter_study/pages/event_handling_detail.dart';

class EventHandlingPage extends StatefulWidget {
  final String title;
  const EventHandlingPage({super.key, required this.title});

  @override
  State<EventHandlingPage> createState() => _EventHandlingPageState();
}

class _EventHandlingPageState extends State<EventHandlingPage> {
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
      children: List.generate(
        _generateItems.length,
        (indexPage) {
          return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: _generateItems[indexPage]['headerValue'],
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
    "headerValue": '原始指针事件处理',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Listener组件',
        'page': const EventHandlingDetailPage(title: 'Listener'),
      },
      {
        'title': '忽略指针事件',
        'page': const EventHandlingDetailPage(title: '忽略指针事件'),
      },
    ],
  },
  {
    "headerValue": '手势识别',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'GestureDetector',
        'page': const EventHandlingDetailPage(title: 'GestureDetector'),
      },
      {
        'title': 'GestureRecognizer',
        'page': const EventHandlingDetailPage(title: 'GestureRecognizer'),
      },
    ],
  },
  {
    "headerValue": 'Flutter事件机制',
    'isExpanded': false,
    'contentList': [
      {
        'title': 'Flutter事件处理流程',
        'page': const EventHandlingDetailPage(title: 'Flutter事件处理流程'),
      },
      {
        'title': '命中测试详解',
        'page': const EventHandlingDetailPage(title: '命中测试详解'),
      },
      {
        'title': '事件分发',
        'page': const EventHandlingDetailPage(title: '事件分发'),
      },
      {
        'title': 'HitTestBehavior',
        'page': const EventHandlingDetailPage(title: 'HitTestBehavior'),
      },
    ],
  },
  {
    "headerValue": '手势原理与手势冲突',
    'isExpanded': false,
    'contentList': [
      {
        'title': '手势识别原理',
        'page': const EventHandlingDetailPage(title: '手势识别原理'),
      },
      {
        'title': '手势竞争',
        'page': const EventHandlingDetailPage(title: '手势竞争'),
      },
      {
        'title': '多手势冲突',
        'page': const EventHandlingDetailPage(title: '多手势冲突'),
      },
      {
        'title': '解决手势冲突',
        'page': const EventHandlingDetailPage(title: '解决手势冲突'),
      },
    ],
  },
  {
    "headerValue": '事件总线',
    'isExpanded': false,
    'contentList': [
      {
        'title': '事件总线',
        'page': const EventHandlingDetailPage(title: '事件总线'),
      },
    ],
  },
  {
    "headerValue": '通知 Notification',
    'isExpanded': false,
    'contentList': [
      {
        'title': '监听通知',
        'page': const EventHandlingDetailPage(title: '监听通知'),
      },
      {
        'title': '自定义通知',
        'page': const EventHandlingDetailPage(title: '自定义通知'),
      },
      {
        'title': '阻止通知冒泡',
        'page': const EventHandlingDetailPage(title: '阻止通知冒泡'),
      },
      {
        'title': '冒泡原理',
        'page': const EventHandlingDetailPage(title: '冒泡原理'),
      },
    ],
  },
];
