import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FunctionalityDetailPage extends StatelessWidget {
  final String title;
  const FunctionalityDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _builderWidgetWithTitle(title),
    );
  }
}

Widget _builderWidgetWithTitle(String title) {
  switch (title) {
    case 'WillPopScope':
    case 'InheritedWidget':
    case '跨组件状态共享':
    case '颜色和主题':
    case 'ValueListenableBuilder':
    case '异步UI更新':
      return const WillPopScopePage();
    case '对话框详解':
      return const AlertDialogDemo();
    default:
      return Container();
  }
}

/**
 * WillPopScope
 */
class WillPopScopePage extends StatelessWidget {
  const WillPopScopePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'WillPopScope',
          '为了避免用户误触返回按钮而导致 App 退出，在很多 App 中都拦截了用户点击返回键的按钮，然后进行一些防误触判断，比如当用户在某一个时间段内点击两次时，才会认为用户是要退出（而非误触）。Flutter中可以通过WillPopScope来实现返回按钮拦截\nonWillPop：是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；最终值为true时，当前路由出栈退出',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/willpopscope.html');
          },
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WillPopScopeDemo(),
                ),
              );
            },
            child: const Text('WillPopScope示例'),
          ),
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'InheritedWidget',
          'InheritedWidget是 Flutter 中非常重要的一个功能型组件，它提供了一种在 widget 树中从上到下共享数据的方式，比如我们在应用的根 widget 中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget 中来获取该共享的数据！这个特性在一些需要在整个 widget 树中共享数据的场景中非常方便！如Flutter SDK中正是通过 InheritedWidget 来共享应用主题（Theme）和 Locale (当前语言环境)信息的',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/inherited_widget.html#_7-2-1-inheritedwidget');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          '跨组件状态共享',
          '在 Flutter 开发中，状态管理是一个永恒的话题。一般的原则是：如果状态是组件私有的，则应该由组件自己管理；如果状态要跨组件共享，则该状态应该由各个组件共同的父元素来管理。对于组件私有的状态管理很好理解，但对于跨组件共享的状态，管理的方式就比较多了，如使用全局事件总线EventBus（将在下一章中介绍），它是一个观察者模式的实现，通过它就可以实现跨组件状态同步：状态持有方（发布者）负责更新、发布状态，状态使用方（观察者）监听状态改变事件来执行一些操作',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/provider.html#_7-3-1-%E9%80%9A%E8%BF%87%E4%BA%8B%E4%BB%B6%E5%90%8C%E6%AD%A5%E7%8A%B6%E6%80%81');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          '颜色和主题',
          '将颜色字符串转成 Color 对象\nColor(0xffdc380d); //如果颜色固定可以直接使用整数值\n//颜色是一个字符串变量\nvar c = "dc380d";\nColor(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF\nColor(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/theme.html#_7-4-1-%E9%A2%9C%E8%89%B2');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          '颜色亮度',
          '假如，我们要实现一个背景颜色和Title可以自定义的导航栏，并且背景色为深色时我们应该让Title显示为浅色；背景色为浅色时，Title 显示为深色。要实现这个功能，我们就需要来计算背景色的亮度，然后动态来确定Title的颜色。Color 类中提供了一个computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅，我们可以根据它来动态确定Title的颜色',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/theme.html#_7-4-1-%E9%A2%9C%E8%89%B2');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'MaterialColor',
          'MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。MaterialColor通过"[]"运算符的索引值来代表颜色的深度，有效的索引有：50，100，200，…，900，数字越大，颜色越深。MaterialColor的默认值为索引等于500的颜色',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/theme.html#_7-4-1-%E9%A2%9C%E8%89%B2');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          '主题（Theme）',
          'Theme组件可以为Material APP定义主题数据（ThemeData）。Material组件库里很多组件都使用了主题数据，如导航栏颜色、标题字体、Icon样式等。Theme内会使用InheritedWidget来为其子树共享样式数据',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/theme.html#_7-4-2-%E4%B8%BB%E9%A2%98-theme');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'ThemeData',
          'ThemeData用于保存是Material 组件库的主题数据，Material组件需要遵守相应的设计规范，而这些规范可自定义部分都定义在ThemeData中了，所以我们可以通过ThemeData来自定义应用主题。在子组件中，我们可以通过Theme.of方法来获取当前的ThemeData\nbrightness：深色还是浅色\nprimarySwatch：主题颜色样本\nprimaryColor：主色，决定导航栏颜色\ncardColor：卡片颜色\ndividerColor：分割线颜色\nbuttonTheme：按钮主题\ndialogBackgroundColor：对话框背景颜色\nfontFamily：文字字体\ntextTheme：字体主题，包括标题、body等文字样式\niconTheme：Icon的默认样式\nplatform：指定平台，应用特定平台控件风格\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/theme.html#_7-4-2-%E4%B8%BB%E9%A2%98-theme');
          },
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeDemo(),
                ),
              );
            },
            child: const Text('Theme示例'),
          ),
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'ValueListenableBuilder',
          'InheritedWidget 提供一种在 widget 树中从上到下共享数据的方式，但是也有很多场景数据流向并非从上到下，比如从下到上或者横向等。为了解决这个问题，Flutter 提供了一个 ValueListenableBuilder 组件，它的功能是监听一个数据源，如果数据源发生变化，则会重新执行其 builder\nvalueListenable：类型为 ValueListenable<T>，表示一个可监听的数据源\nbuilder：数据源发生变化通知时，会重新调用 builder 重新 build 子组件树\nchild: builder 中每次都会重新构建整个子组件树，如果子组件树中有一些不变的部分，可以传递给child，child 会作为builder的第三个参数传递给 builder，通过这种方式就可以实现组件缓存，原理和AnimatedBuilder 第三个 child 相同',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/value_listenable_builder.html#_7-5-1-valuelistenablebuilder');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          '异步UI更新（FutureBuilder、StreamBuilder）',
          '很多时候我们会依赖一些异步数据来动态更新UI，比如在打开一个页面时我们需要先从互联网上获取数据，在获取数据的过程中我们显示一个加载框，等获取到数据时我们再渲染页面；又比如我们想展示Stream（比如文件流、互联网数据接收流）的进度。当然，通过 StatefulWidget 我们完全可以实现上述这些功能。但由于在实际开发中依赖异步数据更新UI的这种场景非常常见，因此Flutter专门提供了FutureBuilder和StreamBuilder两个组件来快速实现这种功能',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html#_7-6-1-futurebuilder');
          },
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'FutureBuilder',
          'FutureBuilder会依赖一个Future，它会根据所依赖的Future的状态来动态构建自身\nfuture：FutureBuilder依赖的Future，通常是一个异步耗时任务\ninitialData：初始数据，用户设置默认数据\nbuilder：Widget构建器；该构建器会在Future执行的不同阶段被多次调用\n\n\n\n\n\n\n我们实现一个路由，当该路由打开时我们从网上获取数据，获取数据时弹一个加载框；获取结束时，如果成功则显示获取到的数据，如果失败则显示错误',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html#_7-6-1-futurebuilder');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('示例'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FutureBuilderDemo()),
              );
            },
          ),
        ),
        const Divider(
          height: 30.0,
        ),
        dcListTitleAndSubTitle(
          'StreamBuilder',
          '在Dart中Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。StreamBuilder正是用于配合Stream来展示流上事件（数据）变化的UI组件',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html#_7-6-2-streambuilder');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('示例'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StreamBuilderDemo()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class WillPopScopeDemo extends StatefulWidget {
  const WillPopScopeDemo({super.key});

  @override
  State<WillPopScopeDemo> createState() => _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  DateTime? _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  const Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
      ),
    );
  }
}

/**
 * Theme Demo实现一个路由换肤功能
 */
class ThemeDemo extends StatefulWidget {
  const ThemeDemo({super.key});

  @override
  State<ThemeDemo> createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  var _themeColor = Colors.teal; //当前路由主题色
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor), //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("主题测试"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //第一行Icon使用主题中的iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("  颜色跟随主题"),
              ],
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal;
              },
            );
          },
          child: const Icon(Icons.palette),
        ),
      ),
    );
  }
}

/**
 * FutureBuilderDemo
 */
class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilderDemo'),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockNetworkData(),
          builder: (context, snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text('Error:${snapshot.error}');
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 2), () => '我是从互联网上获取的数据');
  }
}

/**
 * StreamBuilder demo
 */
class StreamBuilderDemo extends StatelessWidget {
  const StreamBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: counter(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有Stream');
              case ConnectionState.waiting:
                return const Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return const Text('Stream 已关闭');
            }
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }
}

/**
 * 对话框
 */
class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  bool withTree = false; // 复选框选中状态
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'AlertDialog',
          'actions:对话框操作按钮组\nelevation:对话框的阴影\nsemanticLabel:对话框语义化标签(用于读屏软件)\nshape:对话框外形',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/dailog.html#_7-7-1-%E4%BD%BF%E7%94%A8%E5%AF%B9%E8%AF%9D%E6%A1%86');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('AlertDialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("提示"),
                    content: const Text("您确定要删除当前文件吗?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(msg: '点击了取消');
                          Navigator.of(context).pop(); //关闭对话框
                        },
                        child: const Text('取消'),
                      ),
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(msg: '点击了确定');
                          Navigator.of(context).pop(true); //关闭对话框
                        },
                        child: const Text('确定'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        const Divider(height: 30.0),
        Center(
          child: ElevatedButton(
            child: const Text('SimpleDialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('请选择语言'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          // 返回1
                          Navigator.pop(context, 1);
                          Fluttertoast.showToast(msg: '选择了汉语');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text('中文简体'),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          // 返回1
                          Navigator.pop(context, 2);
                          Fluttertoast.showToast(msg: '选择了英语');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('美国英语'),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
        dcListTitleAndSubTitle(
          'Dialog',
          '实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等），\n如果content嵌套ListView会报错，这个时候需要用Dialog',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/dailog.html#_7-7-1-%E4%BD%BF%E7%94%A8%E5%AF%B9%E8%AF%9D%E6%A1%86');
          },
        ),
        const Divider(height: 30.0),
        Center(
          child: ElevatedButton(
            child: const Text('Dialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      children: [
                        const Text('请选择'),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 30,
                            itemExtent: 56.0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('列表：$index'),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(msg: '点击了列表:$index');
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        dcListTitleAndSubTitle(
          '对话框打开动画及遮罩',
          '',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/dailog.html#_7-7-1-%E4%BD%BF%E7%94%A8%E5%AF%B9%E8%AF%9D%E6%A1%86');
          },
        ),
        dcListTitleAndSubTitle(
          '对话框实现原理',
          '',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/dailog.html#_7-7-3-%E5%AF%B9%E8%AF%9D%E6%A1%86%E5%AE%9E%E7%8E%B0%E5%8E%9F%E7%90%86');
          },
        ),
        dcListTitleAndSubTitle(
          '对话框状态管理',
          '我们在用户选择删除一个文件时，会询问是否删除此文件；在用户选择一个文件夹是，应该再让用户确认是否删除子文件夹。为了在用户选择了文件夹时避免二次弹窗确认是否删除子目录，我们在确认对话框底部添加一个“同时删除子目录？”的复选框',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter7/dailog.html#_7-7-4-%E5%AF%B9%E8%AF%9D%E6%A1%86%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('示例'),
            onPressed: () async {
              bool? delete = await showDeleteConfirmDialog();
              Fluttertoast.showToast(
                  msg: delete == null ? '取消删除' : '同时删除子目录: $delete');
            },
          ),
        ),
        const Divider(height: 30),
        Center(
          child: ElevatedButton(
            child: const Text('底部菜单列表'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("$index"),
                        onTap: () {
                          Navigator.of(context).pop(index);
                          Fluttertoast.showToast(msg: '点击了$index');
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        const Divider(height: 30),
        Center(
          child: ElevatedButton(
            child: const Text('Loading框'),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false, //点击遮罩不关闭对话框
                builder: (context) {
                  return UnconstrainedBox(
                    constrainedAxis: Axis.vertical,
                    child: SizedBox(
                      width: 280.0,
                      child: AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CircularProgressIndicator(),
                            Padding(
                              padding: EdgeInsets.only(top: 26.0),
                              child: Text("正在加载，请稍后..."),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const Divider(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            child: const Text('日历选择器'),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  //未来30天可选
                  const Duration(days: 30),
                ),
              ).then((value) {
                Fluttertoast.showToast(msg: '选中的日期是：$value');
              });
            },
          ),
        ),
        const Divider(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            child: const Text('日历选择器2'),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200.0,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      minimumDate: DateTime.now(),
                      maximumDate: DateTime.now().add(
                        const Duration(days: 30),
                      ),
                      maximumYear: DateTime.now().year + 1,
                      onDateTimeChanged: (value) {
                        Fluttertoast.showToast(msg: '选中的日期是：$value');
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
        const Divider(
          height: 30,
        ),
      ],
    );
  }

  Future<bool?> showDeleteConfirmDialog() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("您确定要删除当前文件吗?"),
              Row(
                children: [
                  const Text("同时删除子目录？"),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }
}
