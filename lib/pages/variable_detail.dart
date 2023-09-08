import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/pages/layout_log_print.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VariableDetailPage extends StatelessWidget {
  final String title;
  const VariableDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildWidgetWithTag(title),
    );
  }
}

Widget _buildWidgetWithTag(String title) {
  switch (title) {
    case 'Sliver':
    case 'Scrollable':
    case 'Viewport':
    case '可滚动组件的通用配置':
    case 'ScrollController':
    case '子节点缓存':
    case 'Scrollbar':
      return const SliverUIPage();
    case '简介':
    case '实例':
      return const SingleChildScrollViewPage();
    case '默认构造函数':
      return ListViewUIPage();
    case 'ListView.builder':
      return ListViewUIPage(contentOfset: 1100.0);
    case 'ListView.separated':
      return ListViewUIPage(contentOfset: 1500.0);
    case '固定高度列表':
    case 'ListView 原理':
    case '无限加载列表':
      return ListViewUIPage();
    case '滚动监听及控制':
      return ScrollViewUIPage();
    case '滚动监听':
      return ScrollViewUIPage(scrollOfSet: 2550.0);
    default:
      return Container();
  }
}

/**
 * Sliver
 */
class SliverUIPage extends StatelessWidget {
  const SliverUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Sliver布局模型',
          'Flutter 中的可滚动组件主要由三个角色组成：Scrollable、Viewport 和 Sliver：\n1、Scrollable ：用于处理滑动手势，确定滑动偏移，滑动偏移变化时构建 Viewport 。\n2、Viewport：显示的视窗，即列表的可视区域；\n3、Sliver：视窗里显示的元素',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-1-sliver%E5%B8%83%E5%B1%80%E6%A8%A1%E5%9E%8B',
          ),
        ),
        dcListTitleAndSubTitle(
          '具体布局过程',
          '1、Scrollable 监听到用户滑动行为后，根据最新的滑动偏移构建 Viewport 。\n2、Viewport 将当前视口信息和配置信息通过 SliverConstraints 传递给 Sliver。\n3、Sliver 中对子组件（RenderBox）按需进行构建和布局，然后确认自身的位置、绘制等信息，保存在 geometry 中（一个 SliverGeometry 类型的对象）',
          true,
          () => null,
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          'Scrollable',
          '用于处理滑动手势，确定滑动偏移，滑动偏移变化时构建 Viewport：\n1、axisDirection：滚动方向\n2、physics：此属性接受一个scrollPhysics类型的对象，它决定可滚动组件如何响应用户操作。\n3、controller：接受一个ScrollController对象\n4、viewportBuilder：构建ViewPort的回调',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-2-scrollable',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          'Viewport',
          'Viewport 比较简单，用于渲染当前视口中需要显示 Sliver:\n1、offset：用户的滚动偏移，该参数为Scrollabel 构建 Viewport 时传入，它描述了 Viewport 应该显示那一部分内容\n2、cacheExtent 和 cacheExtentStyle：CacheExtentStyle 是一个枚举，有 pixel 和 viewport 两个取值。当 cacheExtentStyle 值为 pixel 时，cacheExtent 的值为预渲染区域的具体像素长度；当值为 viewport 时，cacheExtent 的值是一个乘数，表示有几个 viewport 的长度，最终的预渲染区域的像素长度为：cacheExtent * viewport 的积， 这在每一个列表项都占满整个 Viewport 时比较实用，这时 cacheExtent 的值就表示前后各缓存几个页面',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-3-viewport',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          'Sliver',
          'Sliver 主要作用是对子组件进行构建和布局，比如 ListView 的 Sliver 需要实现子组件（列表项）按需加载功能，只有当列表项进入预渲染区域时才会去对它进行构建和布局、渲染。\nSliver 对应的渲染对象类型是 RenderSliver，RenderSliver 和 RenderBox 的相同点是都继承自 RenderObject 类，不同点是在布局的时候约束信息不同。RenderBox 在布局时父组件传递给它的约束信息对应的是 BoxConstraints，只包含最大宽高的约束；而 RenderSliver 在布局时父组件（列表）传递给它的约束是对应的是 SliverConstraints',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-4-sliver',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          '可滚动组件的通用配置',
          '几乎所有的可滚动组件在构造时都能指定 scrollDirection（滑动的主轴）、reverse（滑动方向是否反向）、controller、physics 、cacheExtent ，这些属性最终会透传给对应的 Scrollable 和 Viewport，这些属性我们可以认为是可滚动组件的通用属性\n1、reverse：表示是否按照阅读方向相反的方向滑动，如：scrollDirection值为Axis.horizontal 时，即滑动方向为水平，如果阅读方向是从左到右（取决于语言环境，阿拉伯语就是从右到左）。reverse为true时，那么滑动方向就是从右往左',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-5-%E5%8F%AF%E6%BB%9A%E5%8A%A8%E7%BB%84%E4%BB%B6%E7%9A%84%E9%80%9A%E7%94%A8%E9%85%8D%E7%BD%AE',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          'ScrollController',
          '可滚动组件都有一个 controller 属性，通过该属性我们可以指定一个 ScrollController 来控制可滚动组件的滚动，比如可以通过ScrollController来同步多个组件的滑动联动。由于 ScrollController 是需要结合可滚动组件一起工作',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-6-scrollcontroller',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          '子节点缓存',
          '按需加载子组件在大多数场景中都能有正收益，但是有些时候也会有副作用。比如有一个页面，它由一个ListView 组成，我们希望在页面顶部显示一块内容， 这部分内容的数据需要在每次页面打开时通过网络来获取，为此我们通一个 Header 组件来实现，它是一个 StatefulWidget ，会在initState 中请求网络数据，然后将它作为 ListView 的第一个孩子。现在问题来了，因为 ListView 是按需加载子节点的，这意味着如果 Header 滑出 Viewport 的预渲染区域之外时就会被销毁，重新滑入后又会被重新构建，这样就会发起多次网络请求，不符合我们期望，我们预期是Header能够缓存不销毁。\n综上，为了方便控制子组件在滑出可视区域后是否缓存，可滚动组件提供了一种缓存子节点的通用解决方案，它允许开发者对特定的子界限进行缓存',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-7-%E5%AD%90%E8%8A%82%E7%82%B9%E7%BC%93%E5%AD%98',
          ),
        ),
        const Divider(height: 40),
        dcListTitleAndSubTitle(
          'Scrollbar',
          'Scrollbar是一个Material风格的滚动指示器（滚动条），如果要给可滚动组件添加滚动条，只需将Scrollbar作为可滚动组件的任意一个父级组件即可\nScrollbar和CupertinoScrollbar都是通过监听滚动通知来确定滚动条位置的\nCupertinoScrollbar：是 iOS 风格的滚动条，如果你使用的是Scrollbar，那么在iOS平台它会自动切换为CupertinoScrollbar',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/intro.html#_6-1-8-scrollbar',
          ),
        ),
      ],
    );
  }
}

/**
 * ViewPort 
 * */
class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'SingleChildScrollView',
          '类似于Android中的ScrollView，它只能接收一个子组件\nprimary:它表示是否使用 widget 树中默认的PrimaryScrollController（MaterialApp 组件树中已经默认包含一个 PrimaryScrollController 了）；当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且没有指定controller时，primary默认为true',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/single_child_scrollview.html#_6-2-1-%E7%AE%80%E4%BB%8B',
          ),
        ),
        UnconstrainedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SingleChildScrollViewTestRoute(),
              ),
            ),
            child: const Text('点击进入实例'),
          ),
        )
      ],
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollViewTestRoute'),
      ),
      //添加滚动条
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map(
                    (e) => Text(
                      e,
                      textScaleFactor: 2.0,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * ListView
 */
class ListViewUIPage extends StatefulWidget {
  double contentOfset;
  ListViewUIPage({super.key, this.contentOfset = 0.0});

  @override
  State<ListViewUIPage> createState() => _ListViewUIPageState();
}

class _ListViewUIPageState extends State<ListViewUIPage> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _controller.animateTo(
          widget.contentOfset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _controller,
      children: [
        dcListTitleAndSubTitle(
          '默认构造函数',
          '1、itemExtent：该参数如果不为null，则会强制children的“长度”为itemExtent的值；这里的“长度”是指滚动方向上子组件的长度，也就是说如果滚动方向是垂直方向，则itemExtent代表子组件的高度；如果滚动方向为水平方向，则itemExtent就代表子组件的宽度。在ListView中，指定itemExtent比让子组件自己决定自身长度会有更好的性能，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。\n2、prototypeItem：如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时我们可以指定一个列表项，该列表项被称为 prototypeItem（列表项原型）。指定 prototypeItem 后，可滚动组件会在 layout 时计算一次它延主轴方向的长度，这样也就预先知道了所有列表项的延主轴方向的长度，所以和指定 itemExtent 一样，指定 prototypeItem 会有更好的性能。注意，itemExtent 和prototypeItem 互斥，不能同时指定它们\n3、shrinkWrap：该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true\n4、addRepaintBoundaries：该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。RepaintBoundary 读者可以先简单理解为它是一个”绘制边界“，将列表项包裹在RepaintBoundary中可以避免列表项不必要的重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效（具体原因会在本书后面 Flutter 绘制原理相关章节中介绍）。如果列表项自身来维护是否需要添加绘制边界组件，则此参数应该指定为 false',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/listview.html#_6-3-1-%E9%BB%98%E8%AE%A4%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0',
          ),
        ),
        const Divider(height: 30),
        dcListTitleAndSubTitle(
          'ListView.builder',
          'ListView.builder适合列表项比较多或者列表项不确定的情况\nitemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项\nitemCount：列表项的数量，如果为null，则为无限列表',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/listview.html#_6-3-2-listview-builder',
          ),
        ),
        UnconstrainedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LisiViewBuilderPage(),
              ),
            ),
            child: const Text('点击查看实例'),
          ),
        ),
        const Divider(height: 30),
        dcListTitleAndSubTitle(
          'ListView.separated',
          'ListView.separated可以在生成的列表项之间添加一个分割组件，它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/listview.html#_6-3-3-listview-separated',
          ),
        ),
        UnconstrainedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListViewSeparatedPage(),
              ),
            ),
            child: const Text('点击查看实例'),
          ),
        ),
        const Divider(height: 30),
        dcListTitleAndSubTitle(
          '固定高度列表',
          '前面说过，给列表指定 itemExtent 或 prototypeItem 会有更高的性能，所以当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/listview.html#_6-3-4-%E5%9B%BA%E5%AE%9A%E9%AB%98%E5%BA%A6%E5%88%97%E8%A1%A8',
          ),
        ),
        UnconstrainedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FixedExtentListPage(),
              ),
            ),
            child: const Text('点击查看实例'),
          ),
        ),
        const Divider(height: 30),
        dcListTitleAndSubTitle(
          '实例：无限加载列表',
          '假设我们要从数据源异步分批拉取一些数据，然后用ListView展示，当我们滑动到列表末尾时，判断是否需要再去拉取数据，如果是，则去拉取，拉取过程中在表尾显示一个loading，拉取成功后将数据插入列表；如果不需要再去拉取，则在表尾提示"没有更多"',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter6/listview.html#_6-3-6-%E5%AE%9E%E4%BE%8B-%E6%97%A0%E9%99%90%E5%8A%A0%E8%BD%BD%E5%88%97%E8%A1%A8',
          ),
        ),
        const Divider(height: 30),
      ],
    );
  }
}

class LisiViewBuilderPage extends StatelessWidget {
  const LisiViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
      ),
      body: ListView.builder(
        itemCount: 20, //列表项的数量，如果为null，则为无限列表
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (context, index) => ListTile(
          title: Text('这是一个ListView.builder列表：$index'),
        ),
      ),
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用
    Widget divider1 = const Divider(color: Colors.blue);
    Widget divider2 = const Divider(color: Colors.red);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: ListView.separated(
        itemCount: 20,
        //列表项构造器
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '这是一个ListView.separated列表：$index',
          ),
        ),
        //分割器构造器
        separatorBuilder: (context, index) =>
            index % 2 == 0 ? divider1 : divider2,
      ),
    );
  }
}

class FixedExtentListPage extends StatelessWidget {
  const FixedExtentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('固定高度列表'),
      ),
      body: ListView.builder(
        itemCount: 20,
        prototypeItem: const ListTile(),
        // itemExtent: 56.0,
        itemBuilder: (context, index) => LayoutLogPrint(
          tag: index,
          child: ListTile(
            title: Text('这是一个固定高度的列表:$index'),
          ),
        ),
      ),
    );
  }
}

/**
 * 滚动监听及控制
 */
class ScrollViewUIPage extends StatefulWidget {
  double scrollOfSet;
  ScrollViewUIPage({super.key, this.scrollOfSet = 0.0});

  @override
  State<ScrollViewUIPage> createState() => _ScrollViewUIPageState();
}

class _ScrollViewUIPageState extends State<ScrollViewUIPage> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.animateTo(
        widget.scrollOfSet,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _controller,
        children: [
          dcListTitleAndSubTitle(
            '滚动监听ScrollController',
            'ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件\ninitialScrollOffset:初始滚动位置\nkeepScrollOffset:是否保存滚动位置\noffset:可滚动组件当前的滚动位置\njumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会\n',
            true,
            () => launchUrlString(
                'https://book.flutterchina.club/chapter6/scroll_controller.html#_6-4-1-scrollcontroller'),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              '实例',
              style: titleStyle(),
            ),
            subtitle: Text(
              '我们创建一个ListView，当滚动位置发生变化时，我们先打印出当前滚动位置，然后判断当前位置是否超过1000像素，如果超过则在屏幕右下角显示一个“返回顶部”的按钮，该按钮点击后可以使ListView恢复到初始位置；如果没有超过1000像素，则隐藏“返回顶部”按钮',
              style: subTitleStyle(),
            ),
          ),
          UnconstrainedBox(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScrollViewPage(),
                ),
              ),
              child: const Text('点击查看实例'),
            ),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              '滚动位置恢复',
              style: titleStyle(),
            ),
            subtitle: Text(
              'PageStorage是一个用于保存页面(路由)相关数据的组件，它并不会影响子树的UI外观，其实，PageStorage是一个功能型组件，它拥有一个存储桶（bucket），子树中的Widget可以通过指定不同的PageStorageKey来存储各自的数据或状态\n每次滚动结束，可滚动组件都会将滚动位置offset存储到PageStorage中，当可滚动组件重新创建时再恢复。如果ScrollController.keepScrollOffset为false，则滚动位置将不会被存储，可滚动组件重新创建时会使用ScrollController.initialScrollOffset；ScrollController.keepScrollOffset为true时，可滚动组件在第一次创建时，会滚动到initialScrollOffset处，因为这时还没有存储过滚动位置。在接下来的滚动中就会存储、恢复滚动位置，而initialScrollOffset会被忽略\n当一个路由中包含多个可滚动组件时，如果你发现在进行一些跳转或切换操作后，滚动位置不能正确恢复，这时你可以通过显式指定PageStorageKey来分别跟踪不同的可滚动组件的位置\n不同的PageStorageKey，需要不同的值，这样才可以为不同可滚动组件保存其滚动位置',
              style: subTitleStyle(),
            ),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              'ScrollPosition',
              style: titleStyle(),
            ),
            subtitle: Text(
              'ScrollPosition是用来保存可滚动组件的滚动位置的。一个ScrollController对象可以同时被多个可滚动组件使用，ScrollController会为每一个可滚动组件创建一个ScrollPosition对象，这些ScrollPosition保存在ScrollController的positions属性中（List<ScrollPosition>）。ScrollPosition是真正保存滑动位置信息的对象，offset只是一个便捷属性：\ndouble get offset => position.pixels;\n一个ScrollController虽然可以对应多个可滚动组件，但是有一些操作，如读取滚动位置offset，则需要一对一！但是我们仍然可以在一对多的情况下，通过其他方法读取滚动位置，举个例子，假设一个ScrollController同时被两个可滚动组件使用，那么我们可以通过如下方式分别读取他们的滚动位置：\ncontroller.positions.elementAt(0).pixels\ncontroller.positions.elementAt(1).pixels\n我们可以通过controller.positions.length来确定controller被几个可滚动组件使用\nScrollPosition有两个常用方法：animateTo() 和 jumpTo()，它们是真正来控制跳转滚动位置的方法，ScrollController的这两个同名方法，内部最终都会调用ScrollPosition的',
              style: subTitleStyle(),
            ),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              'ScrollController控制原理',
              style: titleStyle(),
            ),
            subtitle: Text(
              '当ScrollController和可滚动组件关联时，可滚动组件首先会调用ScrollController的createScrollPosition()方法来创建一个ScrollPosition来存储滚动位置信息，接着，可滚动组件会调用attach()方法，将创建的ScrollPosition添加到ScrollController的positions属性中，这一步称为“注册位置”，只有注册后animateTo() 和 jumpTo()才可以被调用。\n当可滚动组件销毁时，会调用ScrollController的detach()方法，将其ScrollPosition对象从ScrollController的positions属性中移除，这一步称为“注销位置”，注销后animateTo() 和 jumpTo() 将不能再被调用\n需要注意的是，ScrollController的animateTo() 和 jumpTo()内部会调用所有ScrollPosition的animateTo() 和 jumpTo()，以实现所有和该ScrollController关联的可滚动组件都滚动到指定的位置。',
              style: subTitleStyle(),
            ),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              '滚动监听',
              style: titleStyle(),
            ),
            subtitle: Text(
              'Flutter Widget树中子Widget可以通过发送通知（Notification）与父(包括祖先)Widget通信。父级组件可以通过NotificationListener组件来监听自己关注的通知，这种通信方式类似于Web开发中浏览器的事件冒泡，我们在Flutter中沿用“冒泡”这个术语，关于通知冒泡我们将在后面“事件处理与通知”一章中详细介绍\n\n可滚动组件在滚动时会发送ScrollNotification类型的通知，ScrollBar正是通过监听滚动通知来实现的。通过NotificationListener监听滚动事件和通过ScrollController有两个主要的不同：\n1、NotificationListener可以在可滚动组件到widget树根之间任意位置监听。而ScrollController只能和具体的可滚动组件关联后才可以。\n2、收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置',
              style: subTitleStyle(),
            ),
          ),
          UnconstrainedBox(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScrollNotificationPage(),
                ),
              ),
              child: const Text('点击查看实例'),
            ),
          ),
          const Divider(height: 30),
          ListTile(
            title: Text(
              '',
              style: titleStyle(),
            ),
            subtitle: Text(
              '在接收到滚动事件时，参数类型为ScrollNotification，它包括一个metrics属性，它的类型是ScrollMetrics，该属性包含当前ViewPort及滚动位置等信息：\npixels：当前滚动位置\nmaxScrollExtent：最大可滚动长度\nextentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度\nextentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度\nextentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度\natEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）',
              style: subTitleStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollViewPage extends StatefulWidget {
  const ScrollViewPage({super.key});

  @override
  State<ScrollViewPage> createState() => _ScrollViewPageState();
}

class _ScrollViewPageState extends State<ScrollViewPage> {
  final ScrollController _controller = ScrollController();
  bool showToTopButton = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(
      () {
        print('滚动位置${_controller.offset}'); //打印滚动位置
        if (_controller.offset < 300 && showToTopButton) {
          setState(() {
            showToTopButton = false;
          });
        } else if (_controller.offset >= 300 && !showToTopButton) {
          setState(() {
            showToTopButton = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动控制'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 30,
          itemExtent: 50.0,
          controller: _controller,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              '$index',
            ),
          ),
        ),
      ),
      floatingActionButton: !showToTopButton
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  .0,
                  duration: const Duration(milliseconds: 300), //动画时间
                  curve: Curves.ease, //动画类型
                );
              },
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}

class ScrollNotificationPage extends StatefulWidget {
  const ScrollNotificationPage({super.key});

  @override
  State<ScrollNotificationPage> createState() => _ScrollNotificationPageState();
}

class _ScrollNotificationPageState extends State<ScrollNotificationPage> {
  String progress0 = "0%"; //保存进度百分比
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动通知'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              progress0 = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge:${notification.metrics.extentAfter}");
            return false;
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: 50,
                itemExtent: 50.0,
                itemBuilder: (context, index) => ListTile(
                  title: Text('$index'),
                ),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.black54,
                child: Text(progress0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
