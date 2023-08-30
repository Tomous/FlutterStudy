import 'package:flutter/material.dart';

class ColumnRowPage extends StatelessWidget {
  final String title;
  const ColumnRowPage({super.key, required this.title});

  TextSpan _textSpan(String title, String subTitle) {
    return TextSpan(
      text: title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: subTitle,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text.rich(
              _textSpan('mainAxisAlignment：', '控制子部件在主轴上的对齐方式'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Text.rich(
                    _textSpan('spaceEvenly：', '将子部件均匀地分布在主轴上'),
                  ),
                  Text.rich(
                    _textSpan('spaceBetween：', '将子部件均匀地分布在主轴上，并在它们之间留有空间'),
                  ),
                  Text.rich(
                    _textSpan('spaceAround：',
                        '子部件将在主轴上均匀地分布，并在它们之间留有相等的空间。同时，首尾两个子部件与容器的边缘之间也会保留相等的空间'),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                  )
                ],
              ),
            ),
            Text.rich(
              _textSpan('crossAxisAlignment：', '控制子部件在在交叉轴上的对齐方式'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Text.rich(
                _textSpan('stretch：', '将子部件拉伸以填充交叉轴上的可用空间'),
              ),
            ),
            Text.rich(
              _textSpan('mainAxisSize', '控制 Column/Row 在主轴上的尺寸'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Text.rich(
                    _textSpan('MainAxisSize.max：', '将尽可能地占据主轴上的所有可用空间'),
                  ),
                  Text.rich(
                    _textSpan('MainAxisSize.min：', '将根据其子部件的大小来调整自身的尺寸'),
                  ),
                ],
              ),
            ),
            Text.rich(
              _textSpan('textDirection', '指定子组件在水平方向上的布局方式'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Text.rich(
                    _textSpan('TextDirection.ltr：', '从左到右的文本方向（默认值）'),
                  ),
                  Text.rich(
                    _textSpan('TextDirection.rtl：', '从右到左的文本方向'),
                  ),
                ],
              ),
            ),
            Text.rich(
              _textSpan('verticalDirection', '指定子组件在垂直方向上的对齐方式'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Text.rich(
                    _textSpan('VerticalDirection.down：', '从上到下的对齐方式（默认值）'),
                  ),
                  Text.rich(
                    _textSpan('VerticalDirection.up：', '从下到上的对齐方式'),
                  ),
                ],
              ),
            ),
            Text.rich(
              _textSpan('textBaseline', '指定子组件在垂直方向上的基线对齐方式'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  Text.rich(
                    _textSpan('TextBaseline.alphabetic：', '基于字母的基线对齐方式'),
                  ),
                  Text.rich(
                    _textSpan('TextBaseline.ideographic：', '基于表意字符的基线对齐方式'),
                  ),
                ],
              ),
            ),
            const Text(
              'Expanded的简单实用：\n1、调整 widgets 的大小以适合行或列；\n2、想要一个 widget 占用的空间是兄弟项的两倍，用flex属性',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset('assets/images/image3.jpeg'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/image3.jpeg'),
                  ),
                  Expanded(
                    child: Image.asset('assets/images/image3.jpeg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
