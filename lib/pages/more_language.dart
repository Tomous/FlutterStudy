import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InternationalizationPage extends StatelessWidget {
  final String title;
  const InternationalizationPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          dcListTitleAndSubTitle(
            '支持国际化',
            '可用使用使用第三方（Intl包）来实现国际化\n',
            true,
            () {
              launchUrlString(
                  'https://book.flutterchina.club/chapter13/multi_languages_support.html#_13-1-2-%E6%94%AF%E6%8C%81%E5%9B%BD%E9%99%85%E5%8C%96');
            },
          ),
          dcListTitleAndSubTitle(
            'Flutter UI框架',
            'Flutter的原理是它提供了一套Dart API，然后在底层通过OpenGL这种跨平台的绘制库（内部会调用操作系统API）实现了一套代码跨多端。由于Dart API也是调用操作系统API，所以它的性能接近原生。这里有两点需要注意：\n1、虽然Dart是先调用了OpenGL，OpenGL才会调用操作系统API，但是这仍然是原生渲染，因为OpenGL只是操作系统API的一个封装库，它并不像WebView渲染那样需要 JavaScript 运行环境和CSS渲染器，所以不会有性能损失\n2、Flutter 早期版本底层会调用 OpenGL 这样的跨平台库，但在 iOS 设备上苹果提供了专门的图形库Metal，使用 Metal可以在iOS上获得比OpenGL更好的绘图性能，因此Flutter后来在 iOS 上会优先调用 Metal ，只有当 Metal 不可用时才会降级到OpenGL。不过 Flutter 底层到底是调用的哪个库，作为应用开发者是不需要关注的，我们只需要知道调用的是原生的绘图接口，可以保证高性能即可\n',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter14/flutter_ui_system.html#_14-1-3-%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%E7%BB%98%E5%88%B6api%E7%9A%84%E5%B0%81%E8%A3%85',
              );
            },
          ),
          dcListTitleAndSubTitle(
            'Flutter启动流程和渲染管线',
            'Flutter的入口在"lib/main.dart"的main()函数中，它是Dart应用程序的起点\nmain()函数只调用了一个runApp()方法\nrunApp()方法中\n参数app是一个 widget，它是 Flutter 应用启动后要展示的第一个组件。而WidgetsFlutterBinding正是绑定widget 框架和Flutter 引擎的桥梁\n',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter14/flutter_app_startup.html#_14-3-1-%E5%BA%94%E7%94%A8%E5%90%AF%E5%8A%A8',
              );
            },
          ),
          dcListTitleAndSubTitle(
            '布局（Layout）过程',
            'Layout（布局）过程主要是确定每一个组件的布局信息（大小和位置），Flutter 的布局过程如下：\n1、父节点向子节点传递约束（constraints）信息，限制子节点的最大和最小宽高\n2、子节点根据约束信息确定自己的大小（size）\n3、父节点根据特定布局规则（不同布局组件会有不同的布局算法）确定每一个子节点在父节点布局空间中的位置，用偏移 offset 表示\n4、递归整个过程，确定出每一个节点的大小和位置\n',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter14/layout.html#_14-4-1-%E5%8D%95%E5%AD%90%E7%BB%84%E4%BB%B6%E5%B8%83%E5%B1%80%E7%A4%BA%E4%BE%8B-customcenter',
              );
            },
          ),
          dcListTitleAndSubTitle(
            '绘制（一）绘制原理及Layer',
            'Flutter中和绘制相关的对象有三个，分别是Canvas、Layer 和 Scene：\nCanvas：封装了Flutter Skia各种绘制指令，比如画线、画圆、画矩形等指令\nLayer：分为容器类和绘制类两种；暂时可以理解为是绘制产物的载体，比如调用 Canvas 的绘制 API 后，相应的绘制产物被保存在 PictureLayer.picture 对象中。\nScene：屏幕上将要要显示的元素。在上屏前，我们需要将Layer中保存的绘制产物关联到 Scene 上\n\nFlutter 绘制流程\n1、构建一个 Canvas，用于绘制；同时还需要创建一个绘制指令记录器，因为绘制指令最终是要传递给 Skia 的，而 Canvas 可能会连续发起多条绘制指令，指令记录器用于收集 Canvas 在一段时间内所有的绘制指令，因此Canvas 构造函数第一个参数必须传递一个 PictureRecorder 实例\n2、Canvas 绘制完成后，通过 PictureRecorder 获取绘制产物，然后将其保存在 Layer 中\n3、构建 Scene 对象，将 layer 的绘制产物和 Scene 关联起来\n4、上屏；调用window.render API 将Scene上的绘制产物发送给GPU\n\n',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter14/paint.html#_14-5-1-flutter-%E7%BB%98%E5%88%B6%E5%8E%9F%E7%90%86',
              );
            },
          ),
        ],
      ),
    );
  }
}
