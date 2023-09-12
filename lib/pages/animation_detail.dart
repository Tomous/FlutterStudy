import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/packaging/animated_decorated_box.dart';
import 'package:flutter_study/packaging/slide_transition_x.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AnimationDetailPage extends StatefulWidget {
  final String title;
  const AnimationDetailPage({super.key, required this.title});

  @override
  State<AnimationDetailPage> createState() => _AnimationDetailPageState();
}

class _AnimationDetailPageState extends State<AnimationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildWidgetWithTitle(widget.title),
    );
  }
}

Widget _buildWidgetWithTitle(String title) {
  switch (title) {
    case 'Flutter动画简介':
      return const AnimationDescPage();
    case '动画基本结构及状态监听':
      return const AnimationDemo();
    case '自定义路由切换动画':
      return const RouterUIPage();
    case 'Hero动画':
      return const HeroAnimationPage();
    case '交织动画':
      return const StaggerAnimationPage();
    case '动画切换组件':
      return const AnimatedSwitcherPage();
    case '动画过渡组件':
      return const AnimatedDecoratedPage();
    default:
      return Container();
  }
}

/**
 * Flutter动画简介
 */
class AnimationDescPage extends StatelessWidget {
  const AnimationDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '动画基本原理',
          '在任何系统的UI框架中，动画实现的原理都是相同的，即：在一段时间内，快速地多次改变UI外观；由于人眼会产生视觉暂留，所以最终看到的就是一个“连续”的动画，这和电影的原理是一样的。我们将UI的一次改变称为一个动画帧，对应一次屏幕刷新，而决定动画流畅度的一个重要指标就是帧率FPS（Frame Per Second），即每秒的动画帧数。很明显，帧率越高则动画就会越流畅！一般情况下，对于人眼来说，动画帧率超过16 FPS，就基本能看了，超过 32 FPS就会感觉相对平滑，而超过 32 FPS，大多数人基本上就感受不到差别了。由于动画的每一帧都是要改变UI输出，所以在一个时间段内连续的改变UI输出是比较耗资源的，对设备的软硬件系统要求都较高，所以在UI系统中，动画的平均帧率是重要的性能指标，而在Flutter中，理想情况下是可以实现 60FPS 的，这和原生应用能达到的帧率是基本是持平的',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter9/intro.html#_9-1-1-%E5%8A%A8%E7%94%BB%E5%9F%BA%E6%9C%AC%E5%8E%9F%E7%90%86');
          },
        ),
        dcListTitleAndSubTitle(
          'Flutter中动画抽象',
          '为了方便开发者创建动画，不同的UI系统对动画都进行了一些抽象，比如在 Android 中可以通过XML来描述一个动画然后设置给View。Flutter中也对动画进行了抽象，主要涉及 Animation、Curve、Controller、Tween这四个角色\n\nAnimation\nAnimation是一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态；其中一个比较常用的Animation类是Animation<double>。Animation对象是一个在一段时间内依次生成一个区间(Tween)之间值的类。Animation对象在整个动画执行过程中输出的值可以是线性的、曲线的、一个步进函数或者任何其他曲线函数等等，这由Curve来决定。 根据Animation对象的控制方式，动画可以正向运行（从起始状态开始，到终止状态结束），也可以反向运行，甚至可以在中间切换方向。Animation还可以生成除double之外的其他类型值，如：Animation<Color> 或Animation<Size>。在动画的每一帧中，我们可以通过Animation对象的value属性获取动画的当前状态值\n1、addListener()；它可以用于给Animation添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建\n2、addStatusListener()；它可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用状态改变的监听器\n\nCurve\n动画过程可以是匀速的、匀加速的或者先加速后减速等。Flutter中通过Curve（曲线）来描述动画过程，我们把匀速动画称为线性的(Curves.linear)，而非匀速动画称为非线性的，我们可以通过CurvedAnimation来指定动画的曲线\n\nAnimationController\nAnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法。AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字\nAnimationController生成数字的区间可以通过lowerBound和upperBound来指定\nAnimationController派生自Animation<double>，因此可以在需要Animation对象的任何地方使用。 但是，AnimationController具有控制动画的其他方法，例如forward()方法可以启动正向动画，reverse()可以启动反向动画。在动画开始执行后开始生成动画帧，屏幕每刷新一次就是一个动画帧，在动画的每一帧，会随着根据动画的曲线来生成当前的动画值（Animation.value），然后根据当前的动画值去构建UI，当所有动画帧依次触发时，动画值会依次改变，所以构建的UI也会依次变化，所以最终我们可以看到一个完成的动画。 另外在动画的每一帧，Animation对象会调用其帧监听器，等动画状态发生改变时（如动画结束）会调用状态改变监听器\nTicker\n当创建一个AnimationController时，需要传递一个vsync参数，它接收一个TickerProvider类型的对象，它的主要职责是创建Ticker\nFlutter 应用在启动时都会绑定一个SchedulerBinding，通过SchedulerBinding可以给每一次屏幕刷新添加回调，而Ticker就是通过SchedulerBinding来添加屏幕刷新回调，这样一来，每次屏幕刷新都会调用TickerCallback。使用Ticker(而不是Timer)来驱动动画会防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源，因为Flutter中屏幕刷新时会通知到绑定的SchedulerBinding，而Ticker是受SchedulerBinding驱动的，由于锁屏后屏幕会停止刷新，所以Ticker就不会再触发\n通常我们会将SingleTickerProviderStateMixin添加到State的定义中，然后将State对象作为vsync的值\n\nTween\n默认情况下，AnimationController对象值的范围是[0.0，1.0]。如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用Tween来添加映射以生成不同的范围或数据类型的值\nTween构造函数需要begin和end两个参数。Tween的唯一职责就是定义从输入范围到输出范围的映射。输入范围通常为[0.0，1.0]，但这不是必须的，我们可以自定义需要的范围\nTween对象不存储任何状态，相反，它提供了evaluate(Animation<double> animation)方法，它可以获取动画当前映射值。 Animation对象的当前值可以通过value()方法取到。evaluate函数还执行一些其他处理，例如分别确保在动画值为0.0和1.0时返回开始和结束状态\nTween.animate\n要使用 Tween 对象，需要调用其animate()方法，然后传入一个控制器对象\n\n\n线性插值lerp函数\n动画的原理其实就是每一帧绘制不同的内容，一般都是指定起始和结束状态，然后在一段时间内从起始状态逐渐变为结束状态，而具体某一帧的状态值会根据动画的进度来算出，因此，Flutter 中给有可能会做动画的一些状态属性都定义了静态的 lerp 方法（线性插值）\nlerp 的计算一般遵循： 返回值 = a + (b - a) * t，其他拥有 lerp 方法的类\n需要注意，lerp 是线性插值，意思是返回值和动画进度t是成一次函数（y = kx + b）关系，因为一次函数的图像是一条直线，所以叫线性插值。如果我们想让动画按照一个曲线来执行，我们可以对 t 进行映射，比如要实现匀加速效果，则 t = at²+bt+c，然后指定加速度 a 和 b 即可（大多数情况下需保证 t 的取值范围在[0,1]，当然也有一些情况可能会超出该取值范围，比如弹簧（bounce）效果），而不同 Curve 可以按照不同曲线执行动画的原理本质上就是对 t 按照不同映射公式进行映射实现的\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter9/intro.html#_9-1-2-flutter%E4%B8%AD%E5%8A%A8%E7%94%BB%E6%8A%BD%E8%B1%A1');
          },
        ),
      ],
    );
  }
}

/**
 * 动画基本结构及状态监听
 */
class AnimationDemo extends StatelessWidget {
  const AnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          dcListTitleAndSubTitle(
            '动画基本结构',
            '通过一个图片逐渐放大示例的不同实现来演示Flutter中动画的不同实现方式的区别',
            true,
            () {
              launchUrlString(
                  'https://book.flutterchina.club/chapter9/animation_structure.html#_9-2-1-%E5%8A%A8%E7%94%BB%E5%9F%BA%E6%9C%AC%E7%BB%93%E6%9E%84');
            },
          ),
          const Divider(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Demo()),
              );
            },
            child: const Text('点击查看图片放大动画'),
          ),
          const Divider(height: 30.0),
          dcListTitleAndSubTitle(
            '动画状态监听',
            '我们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter9/animation_structure.html#_9-2-2-%E5%8A%A8%E7%94%BB%E7%8A%B6%E6%80%81%E7%9B%91%E5%90%AC',
              );
            },
          ),
        ],
      ),
    );
  }
}

/**
 * demo
 */
class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    //使用弹性曲线
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          animationController.forward();
        }
      },
    );
    //启动动画(正向执行)
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: GrowTransition(
        animation: animation,
        child: Image.asset(
          './assets/images/image2.jpeg',
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget? child;
  final Animation<double> animation;
  const GrowTransition({super.key, required this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

/**
 * 自定义路由切换动画
 */
class RouterUIPage extends StatelessWidget {
  const RouterUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          dcListTitleAndSubTitle(
            '自定义路由切换动画',
            '我们在第二章“路由管理”一节中讲过：Material组件库中提供了一个MaterialPageRoute组件，它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，而在Android上会上下滑动切换。现在，我们如果在Android上也想使用左右切换风格，该怎么做？一个简单的作法是可以直接使用CupertinoPageRoute\n\n\nCupertinoPageRoute是Cupertino组件库提供的iOS风格的路由切换组件，它实现的就是左右滑动切换。那么我们如何来自定义路由切换动画呢？答案就是PageRouteBuilder。下面我们来看看如何使用PageRouteBuilder来自定义路由切换动画。例如我们想以渐隐渐入动画来实现路由过渡',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter9/route_transition.html',
              );
            },
          ),
        ],
      ),
    );
  }
}

/**
 * Hero动画
 */
class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          dcListTitleAndSubTitle(
            'Hero动画',
            '比如现在有一个头像组件，初始的时候是一个圆形的小图，我们想实现点击后查看大图的功能，为了有较好的体验，小图变成大图和大图变回小图时我们分别执行一个“飞行”过渡动画',
            true,
            () {
              launchUrlString(
                  'https://book.flutterchina.club/chapter9/hero.html#_9-4-1-%E8%87%AA%E5%AE%9E%E7%8E%B0hero%E5%8A%A8%E7%94%BB');
            },
          ),
          const Divider(height: 30.0),
          const ListTile(
            title: Text(
                '假设有两个路由A和B，他们的内容交互如下\nA：包含一个用户头像，圆形，点击后跳到B路由，可以查看大图。\nB：显示用户头像原图，矩形'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HeroAnimationRouteA(),
                ),
              );
            },
            child: const Text('Hero 动画'),
          ),
        ],
      ),
    );
  }
}

class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeroAnimationRouteA'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            InkWell(
              child: Hero(
                tag: 'avatar', //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset(
                    './assets/images/image2.jpeg',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                //打开B路由
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text('原图'),
                          ),
                          body: const HeroAnimationRouteB(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("点击头像"),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'avatar', //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset('./assets/images/image2.jpeg'),
      ),
    );
  }
}
/**
 * 交织动画
 */

class StaggerAnimationPage extends StatelessWidget {
  const StaggerAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          dcListTitleAndSubTitle(
            '交织动画',
            '有些时候我们可能会需要一些复杂的动画，这些动画可能由一个动画序列或重叠的动画组成，比如：有一个柱状图，需要在高度增长的同时改变颜色，等到增长到最大高度后，我们需要在X轴上平移一段距离。可以发现上述场景在不同阶段包含了多种动画，要实现这种效果，使用交织动画（Stagger Animation）\n\n\n实现以下示例:\n1、开始时高度从0增长到300像素，同时颜色由绿色渐变为红色；这个过程占据整个动画时间的60%。2、高度增长到300后，开始沿X轴向右平移100像素；这个过程占用整个动画时间的40%',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter9/stagger_animation.html#_9-5-1-%E7%AE%80%E4%BB%8B',
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('交织动画'),
                    ),
                    body: const StaggerRoute(),
                  ),
                ),
              );
            },
            child: const Text('交织动画'),
          ),
        ],
      ),
    );
  }
}

/**
 * 交织动画 demo
 */
class StaggerAnimation extends StatelessWidget {
  late final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;
  StaggerAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(left: .0),
      end: const EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }
  Widget _buildAnimation(BuildContext context, child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}

class StaggerRoute extends StatefulWidget {
  const StaggerRoute({super.key});

  @override
  State<StaggerRoute> createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      //捕获异常。可能发生在组件销毁时，计时器会被取消。
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: const Text("start animation"),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(controller: _controller),
          ),
        ],
      ),
    );
  }
}

/**
 * 动画切换组件（AnimatedSwitcher）
 */
class AnimatedSwitcherPage extends StatelessWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'AnimatedSwitcher',
          'AnimatedSwitcher 可以同时对其新、旧子元素添加显示、隐藏动画。也就是说在AnimatedSwitcher的子元素发生变化时，会对其旧元素和新元素做动画\n\n\n示例\n实现一个计数器，然后在每一次自增的过程中，旧数字执行缩小动画隐藏，新数字执行放大动画显示',
          true,
          () {
            launchUrlString(
              'https://book.flutterchina.club/chapter9/animated_switcher.html#_9-6-1-animatedswitcher',
            );
          },
        ),
        Center(
          child: ElevatedButton(
            child: const Text('示例计算器'),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const AnimatedSwitcherCounterRoute(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({super.key});

  @override
  State<AnimatedSwitcherCounterRoute> createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count1 = 0;
  int _count2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('示例计算器'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                //执行缩放动画
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                '$_count1',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count1),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Divider(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count1 += 1;
                });
              },
              child: const Text('+1'),
            ),
            const Divider(
              height: 30.0,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.up, //上入下出
                  position: animation,
                );
              },
              child: Text(
                '$_count2',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count2),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Divider(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count2 += 1;
                });
              },
              child: const Text('上入下出'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 动画过渡组件
 */
class AnimatedDecoratedPage extends StatelessWidget {
  const AnimatedDecoratedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '动画过渡组件',
          '为了表述方便，本书约定，将在Widget属性发生变化时会执行过渡动画的组件统称为”动画过渡组件“，而动画过渡组件最明显的一个特征就是它会在内部自管理AnimationController。我们知道，为了方便使用者可以自定义动画的曲线、执行时长、方向等，在前面介绍过的动画封装方法中，通常都需要使用者自己提供一个AnimationController对象来自定义这些属性值。但是，如此一来，使用者就必须得手动管理AnimationController，这又会增加使用的复杂性。因此，如果也能将AnimationController进行封装，则会大大提高动画组件的易用性\n\n\n自定义动画过渡组件\n我们要实现一个AnimatedDecoratedBox，它可以在decoration属性发生变化时，从旧状态变成新状态的过程可以执行一个过渡动画。根据前面所学的知识，我们实现了一个AnimatedDecoratedBox1组件\n\n\nFlutter预置的动画过渡组件\n\n',
          true,
          () {
            launchUrlString(
                'https://book.flutterchina.club/chapter9/animated_widgets.html#_9-7-1-%E8%87%AA%E5%AE%9A%E4%B9%89%E5%8A%A8%E7%94%BB%E8%BF%87%E6%B8%A1%E7%BB%84%E4%BB%B6');
          },
        ),
        const Divider(
          height: 50.0,
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Flutter预置的动画过渡组件'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('Flutter预置的动画过渡组件'),
                    ),
                    body: const AnimatedWidgetsTest(),
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(
          height: 50.0,
        ),
      ],
    );
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  const AnimatedWidgetsTest({super.key});

  @override
  State<AnimatedWidgetsTest> createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = const TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(milliseconds: 400);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              duration: duration,
              padding: EdgeInsets.all(_padding),
              child: const Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: const Text("AnimatedPositioned"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: const Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: const Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: const Text("hello world"),
              onTap: () {
                setState(() {
                  _style = const TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: duration,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                setState(() {
                  _opacity = 0.2;
                });
              },
              child: const Text(
                "AnimatedOpacity",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDecoratedBox1(
            duration: Duration(
                milliseconds: _decorationColor == Colors.red ? 400 : 2000),
            decoration: BoxDecoration(color: _decorationColor),
            child: Builder(builder: (context) {
              return TextButton(
                onPressed: () {
                  setState(() {
                    _decorationColor = _decorationColor == Colors.blue
                        ? Colors.red
                        : Colors.blue;
                  });
                },
                child: const Text(
                  "AnimatedDecoratedBox toggle",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
          )
        ].map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: e,
          );
        }).toList(),
      ),
    );
  }
}
