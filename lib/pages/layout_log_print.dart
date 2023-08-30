import 'package:flutter/material.dart';

class LayoutLogPrint<T> extends StatelessWidget {
  final Widget child;
  final T? tag; //指定日志tag
  const LayoutLogPrint({super.key, this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}:$constraints');
        return true;
      }());
      return child;
    });
  }
}
