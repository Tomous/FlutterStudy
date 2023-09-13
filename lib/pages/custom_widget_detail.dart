import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/packaging/custom_check_box.dart';
import 'package:flutter_study/packaging/custom_paint_route.dart';
import 'package:flutter_study/packaging/done_widget.dart';
import 'package:flutter_study/packaging/gradient_button.dart';
import 'package:flutter_study/packaging/turn_box.dart';
import 'package:flutter_watermark/flutter_watermark.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math';

class CustomWidgetDetailPage extends StatelessWidget {
  final String title;
  const CustomWidgetDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildWidgetWithString(title),
    );
  }
}

Widget _buildWidgetWithString(String title) {
  switch (title) {
    case '自定义组件方法简介':
    case '组合现有组件':
    case '组合实例：TurnBox':
    case 'CustomPaint 与 Canvas':
    case '自绘实例：圆形背景渐变进度条':
    case '自绘组件：CustomCheckbox':
    case '自绘组件: DoneWidget':
    case '水印实例':
      return const CustomWidgetDesc();
    default:
      return Container();
  }
}

/**
 * 自定义组件方法简介
 */
class CustomWidgetDesc extends StatelessWidget {
  const CustomWidgetDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '自定义组件方法简介',
          '当Flutter提供的现有组件无法满足我们的需求，或者我们为了共享代码需要封装一些通用组件，这时我们就需要自定义组件。在Flutter中自定义组件有三种方式：通过组合其他组件、自绘和实现RenderObject\n详情请查看网页版',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/intro.html',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '实例：自定义渐变按钮',
          '实现GradientButton\nFlutter Material组件库中的按钮默认不支持渐变背景，为了实现渐变背景按钮，我们自定义一个GradientButton组件，它需要支持一下功能：\n1、背景支持渐变色\n手指按下时有涟漪效果\n可以支持圆角\n\n效果如下',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/combine.html#_10-2-1-%E5%AE%9E%E4%BE%8B-%E8%87%AA%E5%AE%9A%E4%B9%89%E6%B8%90%E5%8F%98%E6%8C%89%E9%92%AE',
            );
          },
        ),
        Center(
          child: GradientButton(
            colors: const [Colors.orange, Colors.red],
            width: 200.0,
            height: 50.0,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: const Text('自定义GradientButton'),
            onPressed: () {},
          ),
        ),
        dcListTitleAndSubTitle(
          '组合实例：TurnBox',
          '我们之前已经介绍过RotatedBox，它可以旋转子组件，但是它有两个缺点：一是只能将其子节点以90度的倍数旋转；二是当旋转的角度发生变化时，旋转角度更新过程没有动画。\n\n实现一个TurnBox组件，它不仅可以以任意角度来旋转其子节点，而且可以在角度发生变化时执行一个动画以过渡到新状态，同时，我们可以手动指定动画速度',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/turn_box.html',
            );
          },
        ),
        const TurnBoxRoute(),
        dcListTitleAndSubTitle(
          'CustomPaint 与 Canvas',
          '对于一些复杂或不规则的UI，我们可能无法通过组合其他组件的方式来实现，比如我们需要一个正六边形、一个渐变的圆形进度条、一个棋盘等。当然，有时候我们可以使用图片来实现，但在一些需要动态交互的场景静态图片也是实现不了的，比如要实现一个手写输入面板，这时，我们就需要来自己绘制UI外观。\n\n几乎所有的UI系统都会提供一个自绘UI的接口，这个接口通常会提供一块2D画布Canvas，Canvas内部封装了一些基本绘制的API，开发者可以通过Canvas绘制各种自定义图形。在Flutter中，提供了一个CustomPaint 组件，它可以结合画笔CustomPainter来实现自定义图形绘制\n\n\n\nCustomPaint\npainter: 背景画笔，会显示在子节点后面\nforegroundPainter: 前景画笔，会显示在子节点前面\nsize：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现\nisComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销\nwillChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变\n\n\n\n下面实现一个五子棋盘的示例',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/custom_paint.html#_10-4-1-custompaint',
            );
          },
        ),
        const CustomPaintRoute(),
        dcListTitleAndSubTitle(
          '自绘实例：圆形背景渐变进度条',
          '1、支持多种背景渐变色\n2、任意弧度；进度条可以不是整圆\n3、可以自定义粗细、两端是否圆角等样式\n\n',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/gradient_circular_progress_demo.html',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '自绘组件：CustomCheckbox',
          'Flutter 自带的 Checkbox 组件是不能自由指定大小的，本节我们通过自定义一个可以自由指定大小的 CustomCheckbox 组件来演示如何通过定义 RenderObject 的方式来自定义组件（而不是通过组合）\n\n1、有选中和未选中两种状态。\n2、状态切换时要执行动画。\n3、可以自定义外观\n',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/custom_checkbox.html#_10-6-1-customcheckbox',
            );
          },
        ),
        const CustomCheckboxRoute(),
        dcListTitleAndSubTitle(
          '自绘组件: DoneWidget',
          '',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/done_widget.html',
            );
          },
        ),
        Center(
          child: Column(
            children: const [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: DoneWidget(),
              ),
              Divider(
                height: 30.0,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: DoneWidget(
                  outline: true,
                ),
              ),
            ],
          ),
        ),
        dcListTitleAndSubTitle(
          '水印实例: 文本绘制与离屏渲染',
          '',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter10/watermark.html#_10-8-1-%E6%B0%B4%E5%8D%B0%E7%BB%84%E4%BB%B6watermark',
            );
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('水印'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WaterMarkDemo(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

/**
 * TurnBoxWidget
 */
class TurnBoxRoute extends StatefulWidget {
  const TurnBoxRoute({super.key});

  @override
  State<TurnBoxRoute> createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turn = .0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TurnBox(
            turns: _turn,
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.asset(
                './assets/images/image2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Divider(height: 50.0),
          TurnBox(
            turns: _turn,
            speed: 300000,
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.asset(
                './assets/images/image4.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Divider(height: 50.0),
          ElevatedButton(
            child: const Text("顺时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turn += .2;
              });
            },
          ),
          ElevatedButton(
            child: const Text("逆时针旋转1/5圈"),
            onPressed: () {
              setState(() {
                _turn -= .2;
              });
            },
          ),
        ],
      ),
    );
  }
}

/**
 * CustomCheckbox
 */
class CustomCheckboxRoute extends StatefulWidget {
  const CustomCheckboxRoute({super.key});

  @override
  State<CustomCheckboxRoute> createState() => _CustomCheckboxRouteState();
}

class _CustomCheckboxRouteState extends State<CustomCheckboxRoute> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCheckbox(
            value: _checked,
            onChanged: _onChange,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: 16.0,
              height: 16.0,
              child: CustomCheckbox(
                strokeWidth: 1,
                radius: 1,
                value: _checked,
                onChanged: _onChange,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: CustomCheckbox(
              strokeWidth: 3,
              radius: 3,
              value: _checked,
              onChanged: _onChange,
            ),
          ),
        ],
      ),
    );
  }

  void _onChange(value) {
    setState(() => _checked = value);
  }
}

/**
 * 水印实力
 */
class WaterMarkDemo extends StatelessWidget {
  WaterMarkDemo({super.key});
// 初始化插件
  final DisableScreenshots _plugin = DisableScreenshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('水印'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _plugin.addWatermark(
                  context,
                  'watermark',
                  rowCount: 4,
                  columnCount: 8,
                );
              },
              child: const Text('添加默认水印'),
            ),
            ElevatedButton(
              onPressed: () =>
                  // 添加自定义widget当做水印
                  _plugin.addCustomWatermark(
                context,
                const Watermark(
                  rowCount: 3,
                  columnCount: 10,
                  text: "自定义水印",
                ),
              ),
              child: const Text("添加自定义水印"),
            ),
            ElevatedButton(
              onPressed: () =>
                  // 移除水印
                  _plugin.removeWatermark(),
              child: const Text("删除水印"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(
                      title: const Text("我是新页面"),
                    ),
                    body: const Center(
                      child: Text("new page"),
                    ),
                  ),
                ),
              ),
              child: const Text("进入新页面"),
            ),
          ],
        ),
      ),
    );
  }
}

class Watermark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;

  const Watermark(
      {Key? key,
      required this.rowCount,
      required this.columnCount,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: createColumnWidgets(),
      ),
    );
  }

  List<Widget> createRowWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
        child: Center(
          child: Transform.rotate(
            angle: pi / 10,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0x08000000),
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      );
      list.add(widget);
    }
    return list;
  }

  List<Widget> createColumnWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
        child: Row(
          children: createRowWidgets(),
        ),
      );
      list.add(widget);
    }
    return list;
  }
}
