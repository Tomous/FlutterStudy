import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventHandlingDetailPage extends StatelessWidget {
  final String title;
  const EventHandlingDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildWidgetWithTitle(title),
    );
  }
}

Widget _buildWidgetWithTitle(String title) {
  switch (title) {
    case 'Listener':
    case '忽略指针事件':
      return const ListenerPage();
    case 'GestureDetector':
    case 'GestureRecognizer':
      return const GestureDetectorPage();
    case 'Flutter事件处理流程':
    case '命中测试详解':
    case '事件分发':
    case 'HitTestBehavior':
      return const FlutterHandleEventPage();
    case '手势识别原理':
    case '手势竞争':
    case '多手势冲突':
    case '解决手势冲突':
    case '事件总线':
      return const GestureDealPage();
    case '监听通知':
    case '自定义通知':
    case '阻止通知冒泡':
    case '冒泡原理':
      return const NotificationPage();
    default:
      return Container();
  }
}

class ListenerPage extends StatelessWidget {
  const ListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Listener',
          'Flutter中可以使用Listener来监听原始触摸事件，按照本书对组件的分类，则Listener也是一个功能性组件\n\nonPointerDown:手指按下回调\nonPointerMove:手指移动回调\nonPointerUp:手指抬起回调\nonPointerCancel:触摸事件取消回调',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/listener.html#_8-1-2-listener-%E7%BB%84%E4%BB%B6');
          },
        ),
        const Divider(height: 30.0),
        Center(
          child: ElevatedButton(
            child: const Text('Listener Demo'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListenerDemo(),
                ),
              );
            },
          ),
        ),
        const Divider(height: 30.0),
        dcListTitleAndSubTitle(
          'PointerEvent属性介绍',
          'position：它是指针相对于当对于全局坐标的偏移\nlocalPosition: 它是指针相对于当对于本身布局坐标的偏移\ndelta：两次指针移动事件（PointerMoveEvent）的距离\npressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1\norientation：指针移动方向，是一个角度值',
          true,
          () {},
        ),
        const Divider(height: 30.0),
        dcListTitleAndSubTitle(
          '忽略指针事件',
          '假如我们不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，这两个组件都能阻止子树接收指针事件，不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以\n\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/listener.html#_8-1-3-%E5%BF%BD%E7%95%A5%E6%8C%87%E9%92%88%E4%BA%8B%E4%BB%B6');
          },
        ),
      ],
    );
  }
}

/**
 * Listener demo
 */
class ListenerDemo extends StatefulWidget {
  const ListenerDemo({super.key});

  @override
  State<ListenerDemo> createState() => _ListenerDemoState();
}

class _ListenerDemoState extends State<ListenerDemo> {
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listener Demo'),
      ),
      body: Listener(
        child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          width: double.infinity,
          height: 300.0,
          child: Text(
            '${_event?.localPosition ?? ''}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPointerDown: (event) => setState(
          () {
            _event = event;
          },
        ),
        onPointerMove: (event) => setState(() {
          _event = event;
        }),
        onPointerUp: (event) => setState(() {
          _event = event;
        }),
      ),
    );
  }
}

/**
 * GestureDetectorPage
 */
class GestureDetectorPage extends StatelessWidget {
  const GestureDetectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'GestureDetector',
          'GestureDetector是一个用于手势识别的功能性组件，我们通过它可以来识别各种手势。GestureDetector 内部封装了 Listener，用以识别语义化的手势\n\n\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-1-gesturedetector');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('点击、双击、长按'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GestureDetectorDemo(),
                ),
              );
            },
          ),
        ),
        dcListTitleAndSubTitle(
          '拖动、滑动',
          '一次完整的手势过程是指用户手指按下到抬起的整个过程，期间，用户按下手指后可能会移动，也可能不会移动。GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的。GestureDetector会将要监听的组件的原点（左上角）作为本次手势的原点，当用户在监听的组件上按下手指时，手势识别就会开始\n\n\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-1-gesturedetector');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('拖动、滑动'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GestureDetectorDragDemo(),
                ),
              );
            },
          ),
        ),
        dcListTitleAndSubTitle(
          '',
          'DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点(左上角)的偏移\nDragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量\nDragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-1-gesturedetector');
          },
        ),
        dcListTitleAndSubTitle(
          '单一方向拖动',
          'onVerticalDragUpdate:垂直方向拖动事件\n\nonHorizontalDragUpdate:水平方向拖动事件',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-1-gesturedetector');
          },
        ),
        dcListTitleAndSubTitle(
          '缩放',
          'onScaleUpdate',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-1-gesturedetector');
          },
        ),
        dcListTitleAndSubTitle(
          'GestureRecognizer',
          'GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，GestureDetector直接可以接收一个子widget。GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类\n\n\n假设我们要给一段富文本（RichText）的不同部分分别添加点击事件处理器，但是TextSpan并不是一个widget，这时我们不能用GestureDetector，但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer\n假设我们需要在点击时给文本变色',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/gesture.html#_8-2-2-gesturerecognizer');
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('示例'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GestureRecognizerPage(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

/**
 * GestureDetector demo:点击、双击、长按
 */
class GestureDetectorDemo extends StatefulWidget {
  const GestureDetectorDemo({super.key});

  @override
  State<GestureDetectorDemo> createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  String _operation = 'No Gesture detected!'; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Demo'),
      ),
      body: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          color: Colors.blue,
          child: Text(
            _operation,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateOperation('onTap'),
        onDoubleTap: () => updateOperation('onDoubleTap'),
        onLongPress: () => updateOperation('onLongPress'),
      ),
    );
  }

  void updateOperation(String string) {
    setState(() {
      _operation = string;
    });
  }
}

/**
 * GestureDetector Drag:拖动、滑动
 */
class GestureDetectorDragDemo extends StatefulWidget {
  const GestureDetectorDragDemo({super.key});

  @override
  State<GestureDetectorDragDemo> createState() =>
      _GestureDetectorDragDemoState();
}

class _GestureDetectorDragDemoState extends State<GestureDetectorDragDemo>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拖动、滑动'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: const CircleAvatar(
                child: Text('A'),
              ),
              //手指按下时会触发此回调
              onPanDown: (details) {
                //打印手指按下的位置(相对于屏幕)
                Fluttertoast.showToast(
                    msg: '手指按下的位置:${details.globalPosition}');
              },
              //手指滑动时会触发此回调
              onPanUpdate: (details) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _top += details.delta.dy;
                  _left += details.delta.dx;
                });
              },
              onPanEnd: (details) {
                //打印滑动结束时在x、y轴上的位置
                Fluttertoast.showToast(msg: '滑动结束:${details.velocity}');
              },
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * GestureRecognizer page
 */
class GestureRecognizerPage extends StatefulWidget {
  const GestureRecognizerPage({super.key});

  @override
  State<GestureRecognizerPage> createState() => _GestureRecognizerPageState();
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    super.dispose();
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _gestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: '你好世界'),
              TextSpan(
                text: '点我变色',
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle ? Colors.blue : Colors.red,
                ),
                recognizer: _gestureRecognizer
                  ..onTap = () {
                    setState(
                      () {
                        _toggle = !_toggle;
                      },
                    );
                  },
              ),
              const TextSpan(text: "你好世界"),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * Flutter 事件机制
 */
class FlutterHandleEventPage extends StatelessWidget {
  const FlutterHandleEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Flutter 事件处理流程',
          '1、命中测试：当手指按下时，触发 PointerDownEvent 事件，按照深度优先遍历当前渲染（render object）树，对每一个渲染对象进行“命中测试”（hit test），如果命中测试通过，则该渲染对象会被添加到一个 HitTestResult 列表当中\n2、事件分发：命中测试完毕后，会遍历 HitTestResult 列表，调用每一个渲染对象的事件处理方法（handleEvent）来处理 PointerDownEvent 事件，该过程称为“事件分发”（event dispatch）。随后当手指移动时，便会分发 PointerMoveEvent 事件\n3、事件清理：当手指抬（ PointerUpEvent ）起或事件取消时（PointerCancelEvent），会先对相应的事件进行分发，分发完毕后会清空 HitTestResult 列表',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/hittest.html#_8-3-1-flutter-%E4%BA%8B%E4%BB%B6%E5%A4%84%E7%90%86%E6%B5%81%E7%A8%8B');
          },
        ),
      ],
    );
  }
}

/**
 * 手势原理与手势冲突
 */
class GestureDealPage extends StatelessWidget {
  const GestureDealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '手势原理与手势冲突',
          '具体请看网页端',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter8/gesture_conflict.html#_8-4-1-%E6%89%8B%E5%8A%BF%E8%AF%86%E5%88%AB%E5%8E%9F%E7%90%86',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '手势竞争',
          '如果对一个组件同时监听水平和垂直方向的拖动手势，当我们斜着拖动时哪个方向的拖动手势回调会被触发？实际上取决于第一次移动时两个轴上的位移分量，哪个轴的大，哪个轴在本次滑动事件竞争中就胜出。上面已经说过，每一个手势识别器（GestureRecognizer）都是一个“竞争者”（GestureArenaMember），当发生指针事件时，他们都要在“竞技场”去竞争本次事件的处理权，默认情况最终只有一个“竞争者”会胜出(win)。例如，假设有一个ListView，它的第一个子组件也是ListView，如果现在滑动这个子ListView，父ListView会动吗？答案是否定的，这时只有子ListView会动，因为这时子ListView会胜出而获得滑动事件的处理权',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter8/gesture_conflict.html#_8-4-2-%E6%89%8B%E5%8A%BF%E7%AB%9E%E4%BA%89',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '多手势冲突',
          '',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter8/gesture_conflict.html#_8-4-3-%E5%A4%9A%E6%89%8B%E5%8A%BF%E5%86%B2%E7%AA%81',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '解决手势冲突',
          '1、使用 Listener。这相当于跳出了手势识别那套规则\n2、自定义手势手势识别器（ Recognizer）',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter8/gesture_conflict.html#_8-4-5-%E8%A7%A3%E5%86%B3%E6%89%8B%E5%8A%BF%E5%86%B2%E7%AA%81',
            );
          },
        ),
        dcListTitleAndSubTitle(
          '事件总线',
          '在 App 中，我们经常会需要一个广播机制，用以跨页面事件通知，比如一个需要登录的 App 中，页面会关注用户登录或注销事件，来进行一些状态更新。这时候，一个事件总线便会非常有用，事件总线通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色，可以通过事件总线来触发事件和监听事件，',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter8/eventbus.html',
            );
          },
        ),
      ],
    );
  }
}

/**
 * Notification
 */
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '通知 Notification',
          '通知（Notification）是Flutter中一个重要的机制，在widget树中，每一个节点都可以分发通知，通知会沿着当前节点向上传递，所有父节点都可以通过NotificationListener来监听通知。Flutter中将这种由子向父的传递通知的机制称为通知冒泡（Notification Bubbling）。通知冒泡和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止，但用户触摸事件不行\n\n\n\n具体事项请查看网页版',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter8/notification.html#_8-6-1-%E7%9B%91%E5%90%AC%E9%80%9A%E7%9F%A5');
          },
        ),
      ],
    );
  }
}
