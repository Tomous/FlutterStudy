import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:math' as math;

class ContainerDetailPage extends StatelessWidget {
  final String title;
  const ContainerDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildWidgetWithTag(title),
    );
  }
}

Widget buildWidgetWithTag(String title) {
  switch (title) {
    case 'Padding':
      return const PaddingUIPage();
    case 'DecoratedBox':
      return const DecoratedBoxUIPage();
    case 'Transform':
      return const TransformUIPage();
    case 'Container':
      return const ContainerUIPage();
    case 'Clip':
      return const ClipUIPage();
    case 'FittedBox':
      return const FittedBoxUIPage();
    case 'Scaffold':
      return const ScaffoldUIPage();
    default:
      return Container(
        color: Colors.red,
      );
  }
}

/*
   Scaffold
*/
class ScaffoldUIPage extends StatelessWidget {
  const ScaffoldUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '页面骨架（Scaffold）',
          '一个完整的路由页可能会包含导航栏、抽屉菜单(Drawer)以及底部 Tab 导航菜单等。如果每个路由页面都需要开发者自己手动去实现这些，这会是一件非常麻烦且无聊的事。幸运的是，Flutter Material 组件库提供了一些现成的组件来减少我们的开发任务。Scaffold 是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面。',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/material_scaffold.html#_5-7-1-scaffold',
          ),
        ),
        const ListTile(
          title: Text('实现如下实例'),
          subtitle: Text(
              '1、一个导航栏\n2、导航栏右边有一个分享按钮\n3、有一个抽屉菜单\n4、有一个底部导航\n5、右下角有一个悬浮的动作按钮'),
        ),
        UnconstrainedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScaffoldRoute(),
              ),
            ),
            child: const Text('点击进入Scaffold APP'),
          ),
        ),
        const Divider(height: 50),
        dcListTitleAndSubTitle(
          'AppBar',
          'AppBar是一个Material风格的导航栏，通过它可以设置导航栏标题、导航栏菜单、导航栏底部的Tab标题等',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/material_scaffold.html#_5-7-2-appbar',
          ),
        ),
        const Divider(height: 50),
        dcListTitleAndSubTitle(
          '抽屉菜单Drawer',
          'Scaffold的drawer和endDrawer属性可以分别接受一个Widget来作为页面的左、右抽屉菜单。如果开发者提供了抽屉菜单，那么当用户手指从屏幕左（或右）侧向里滑动时便可打开抽屉菜单',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/material_scaffold.html#_5-7-3-%E6%8A%BD%E5%B1%89%E8%8F%9C%E5%8D%95drawer',
          ),
        ),
        const ListTile(
          title: Text(
            'key：唯一标识\nelevation：设置抽屉的阴影效果\nshadowColor：设置抽屉周围阴影的颜色\nsurfaceTintColor：指定抽屉的表面（surface）的着色颜色\nshape：用于定义抽屉的形状\nsemanticLabel：为抽屉提供语义化的标签，以便屏幕阅读器或辅助功能可以正确地描述和标识抽屉。该属性接受一个字符串值，用于描述抽屉的内容或用途',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

/*
   Padding
*/
class PaddingUIPage extends StatelessWidget {
  const PaddingUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Padding',
          '可以给其子节点添加填充（留白），和边距效果类似。我们在前面很多示例中都已经使用过它了',
          true,
          () => launchUrlString(
              "https://book.flutterchina.club/chapter5/padding.html#_5-1-1-padding"),
        ),
        ListTile(
          title: const Text(
            'EdgeInsets',
          ),
          onTap: () => launchUrlString(
            'https://book.flutterchina.club/chapter5/padding.html#_5-1-2-edgeinsets',
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'fromLTRB',
              '分别指定四个方向的填充',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'all',
              '所有方向均使用相同数值的填充。',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'only',
              '可以设置具体某个方向的填充(可以同时指定多个方向)',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'symmetric({ vertical, horizontal })',
              '用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right',
            ),
          ),
        ),
      ],
    );
  }
}

/*
   DecoratedBox
*/
class DecoratedBoxUIPage extends StatelessWidget {
  const DecoratedBoxUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'DecoratedBox',
          '可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/decoratedbox.html#_5-2-1-decoratedbox',
          ),
        ),
        ListTile(
          title: Text(
            '属性',
            style: titleStyle(),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'decoration',
              '代表将要绘制的装饰，它的类型为Decoration。Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'position',
              '此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类有两个值：\nbackground：在子组件之后绘制，即背景装饰。\nforeground：在子组件之上绘制，即前景',
            ),
          ),
        ),
        dcListTitleAndSubTitle(
          'BoxDecoration',
          '我们通常会直接使用BoxDecoration类，它是一个Decoration的子类，实现了常用的装饰元素的绘制',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/decoratedbox.html#_5-2-2-boxdecoration',
          ),
        ),
        ListTile(
          title: Text(
            '属性',
            style: titleStyle(),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'color',
              '颜色',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'image',
              '图片',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'border',
              '边框',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'borderRadius',
              '圆角',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'boxShadow',
              '阴影,可以指定多个',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'gradient',
              '渐变',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'backgroundBlendMode',
              '背景混合模式',
            ),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
              'shape = BoxShape.rectangle,',
              '形状',
            ),
          ),
        ),
        ListTile(
          title: Text(
            '实例',
            style: titleStyle(),
          ),
        ),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange.shade100],
              ), //背景渐变
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 80.0),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text(
              '通过BoxDecoration我们实现了一个渐变按钮的外观，但此示例还不是一个标准的按钮，因为它还不能响应点击事件，我们将在10.2节中实现一个完整功能的GradientButton。另外，上面的例子中使用了LinearGradient类，它用于定义线性渐变的类，Flutter中还提供了其他渐变配置类，如RadialGradient、SweepGradient'),
          onTap: () => launchUrlString(
              'https://book.flutterchina.club/chapter5/decoratedbox.html#_5-2-3-%E5%AE%9E%E4%BE%8B'),
        ),
      ],
    );
  }
}

/*
   Transform
*/
class TransformUIPage extends StatelessWidget {
  const TransformUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Transform',
          '可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作',
          true,
          () => launchUrlString(
              'https://book.flutterchina.club/chapter5/transform.html#_5-3-1-%E5%B9%B3%E7%A7%BB'),
        ),
        UnconstrainedBox(
          child: Container(
            color: Colors.black,
            child: Transform(
              transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              alignment: Alignment.topCenter, //相对于坐标系原点的对齐方式
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ),
        const Divider(height: 30),
        ListTile(
          title: Text(
            '平移',
            style: titleStyle(),
          ),
          subtitle: Text(
            'Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离',
            style: subTitleStyle(),
          ),
        ),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: const Offset(20.0, 5.0),
              child: const Text('Hello world'),
            ),
          ),
        ),
        const Divider(height: 30),
        ListTile(
          title: Text(
            '旋转',
            style: titleStyle(),
          ),
          subtitle: Text(
            'Transform.rotate:可以对子组件进行旋转变换',
            style: subTitleStyle(),
          ),
        ),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: const Text('hello world'),
            ),
          ),
        ),
        const Divider(height: 30),
        ListTile(
          title: Text(
            '缩放',
            style: titleStyle(),
          ),
          subtitle: Text(
            'Transform.scale:可以对子组件进行缩小或放大',
            style: subTitleStyle(),
          ),
        ),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5,
              child: const Text('hello world'),
            ),
          ),
        ),
        const Divider(height: 30),
        dcListTitleAndSubTitle(
          'Transform 注意事项',
          'Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/transform.html#_5-3-4-transform-%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A1%B9',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.scale(
                scale: 1.5,
                child: const Text('hello world'),
              ),
            ),
            const Text(
              '你好',
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
          ],
        ),
        ListTile(
          title: Text(
            '由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，所以第二个Text会紧挨着红色部分，最终就会出现文字重合',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 30),
        ListTile(
          title: Text(
            'RotatedBox',
            style: titleStyle(),
          ),
          subtitle: Text(
            'RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小',
            style: subTitleStyle(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child: Text('hello world'),
              ),
            ),
            Text(
              '你好',
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
          ],
        ),
        ListTile(
          title: Text(
            '由于RotatedBox是作用于layout阶段，所以子组件会旋转90度（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上，所以最终就是上图的效果，读者可以和前面Transform.rotate示例对比理解',
            style: subTitleStyle(),
          ),
        ),
      ],
    );
  }
}

/*
   Container
*/
class ContainerUIPage extends StatelessWidget {
  const ContainerUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'Container',
          'Container是一个组合类容器，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/container.html#_5-4-1-container',
          ),
        ),
        const ListTile(
          title: Text(
              'color：背景色\ndecoration：背景装饰，他和color是互斥的，不能同时设置。\nforegroundDecoration：前景装饰\nwidth：宽度\n height：高度\n constraint：容器大小的限制条件，如果设置了width和height，会优先以width和height为主'),
        ),
        const Divider(height: 30),
        UnconstrainedBox(
          child: Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              left: 50.0,
            ),
            constraints: const BoxConstraints.tightFor(
              width: 100.0,
              height: 80.0,
            ), //卡片大小
            //背景装饰
            decoration: const BoxDecoration(
              //背景径向渐变
              gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                center: Alignment.center,
                radius: .98,
              ),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            transform: Matrix4.rotationZ(.2), //卡片倾斜变换
            alignment: Alignment.center,
            child: const Text(
              '5.20',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
        const Divider(height: 30),
        const ListTile(
          title: Text('Padding 和 Margin'),
        ),
        UnconstrainedBox(
          child: Container(
            margin: const EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: const Text('margin all 20'),
          ),
        ),
        UnconstrainedBox(
          child: Container(
            padding: const EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: const Text('Padding all 20'),
          ),
        ),
      ],
    );
  }
}

/*
   Clip
*/
class ClipUIPage extends StatelessWidget {
  const ClipUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      'assets/images/image3.jpeg',
      width: 100,
    );
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          '剪裁（Clip）',
          '',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/clip.html#_5-5-1-%E5%89%AA%E8%A3%81%E7%B1%BB%E7%BB%84%E4%BB%B6',
          ),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle(
            'ClipOval',
            '子组件为正方形时裁剪为内贴圆形，子组件为矩形时裁剪为内贴椭圆',
          )),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle(
            'ClipRRect',
            '将子组件裁剪为圆角矩形',
          )),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle(
            'ClipRect',
            '默认裁剪掉子组件布局空间之外的绘制内容（益处部分裁剪掉）',
          )),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle(
            'ClipPath',
            '按照自定义的路径裁剪',
          )),
        ),
        Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [avatar, const Text('不裁剪')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(child: avatar),
                  const Text('裁剪为圆形'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: avatar,
                  ),
                  const Text('裁剪为圆角矩形'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  const Text(
                    '宽度设为原来宽度一半，另一半会溢出',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5,
                      child: avatar,
                    ),
                  ),
                  const Text(
                    '宽度设为原来宽度一半',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(height: 50),
        dcListTitleAndSubTitle(
          '自定义裁剪（CustomClipper）',
          '如果我们想剪裁子组件的特定区域，比如，在上面示例的图片中，如果我们只想截取图片中部40×30像素的范围应该怎么做？这时我们可以使用CustomClipper来自定义剪裁区域',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/clip.html#_5-5-2-%E8%87%AA%E5%AE%9A%E4%B9%89%E8%A3%81%E5%89%AA-customclipper',
          ),
        ),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar, //使用自定义的clipper
            ),
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  //getClip()是用于获取剪裁区域的接口，由于图片大小是100×100，我们返回剪裁区域为Rect.fromLTWH(25.0, 30.0, 50.0, 40.0)，即图片中部50×40像素的范围
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(25.0, 30.0, 50.0, 40.0);

//shouldReclip() 接口决定是否重新剪裁。如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

/*
   FittedBox
*/
class FittedBoxUIPage extends StatelessWidget {
  const FittedBoxUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dcListTitleAndSubTitle(
          'FittedBox',
          '子组件大小超出了父组件大小时，如果不经过处理的话 Flutter 中就会显示一个溢出警告并在控制台打印错误日志，比如下面代码会导致溢出',
          true,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/fittedbox.html#_5-6-1-fittedbox',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Text('xxxxxx' * 30), //文本长度超出 Row 的最大宽度会溢出
            ],
          ),
        ),
        ListTile(
          title: Text(
            '上面只是一个例子，理论上我们经常会遇到子元素的大小超过他父容器的大小的情况，比如一张很大图片要在一个较小的空间显示，根据Flutter 的布局协议，父组件会将自身的最大显示空间作为约束传递给子组件，子组件应该遵守父组件的约束，如果子组件原始大小超过了父组件的约束区域，则需要进行一些缩小、裁剪或其他处理，而不同的组件的处理方式是特定的，比如 Text 组件，如果它的父组件宽度固定，高度不限的话，则默认情况下 Text 会在文本到达父组件宽度的时候换行。那如果我们想让 Text 文本在超过父组件的宽度时不要换行而是字体缩小呢？还有一种情况，比如父组件的宽高固定，而 Text 文本较少，这时候我们想让文本放大以填充整个父组件空间该怎么做呢？',
            style: subTitleStyle(),
          ),
        ),
        ListTile(
          title: Text(
            '实际上，上面这两个问题的本质就是：子组件如何适配父组件空间。而根据 Flutter 布局协议适配算法应该在容器或布局组件的 layout 中实现，为了方便开发者自定义适配规则，Flutter 提供了一个 FittedBox 组件，定义如下：',
            style: subTitleStyle(),
          ),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle('fit', '适配方式')),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle('alignment', '对齐方式')),
        ),
        ListTile(
          title: Text.rich(textSpanTitleAndSubTitle('clipBehavior', '是否裁剪')),
        ),
        dcListTitleAndSubTitle(
          '适配原理',
          '1、FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。\n2、FittedBox 对子组件布局结束后就可以获得子组件真实的大小。\n3、FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示',
          false,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/fittedbox.html#_5-6-1-fittedbox',
          ),
        ),
        const Divider(height: 50),
        dcListTitleAndSubTitle(
          '实例：单行缩放布局',
          '比如我们有三个数据指标，需要在一行显示，因为换行的话就会将我们的页面布局打乱，所以换行是不能接受的。因为不同设备的屏幕宽度不同，且不同人的数据也不同，所以就会出现数据太长或屏幕太窄时三个数据无法在一行显示，因此，我们希望当无法在一行显示时能够对组件进行适当的缩放以确保一行能够显示的下，为此我们写了一个测试 demo',
          false,
          () => launchUrlString(
            'https://book.flutterchina.club/chapter5/fittedbox.html#_5-6-2-%E5%AE%9E%E4%BE%8B-%E5%8D%95%E8%A1%8C%E7%BC%A9%E6%94%BE%E5%B8%83%E5%B1%80',
          ),
        ),
      ],
    );
  }
}

///实例 Scaffold App
class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  State<ScaffoldRoute> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;
  String _appName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //导航栏
      appBar: AppBar(
        centerTitle: true,
        title: Text(_appName),
        //导航栏右侧菜单
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: '点击了分享', gravity: ToastGravity.CENTER);
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: '点击了设置',
                gravity: ToastGravity.CENTER,
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              _appName = index == 0
                  ? 'Home'
                  : index == 1
                      ? 'Business'
                      : 'School';
            },
          );
        },
      ),
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: '点击了悬浮按钮', gravity: ToastGravity.CENTER);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      //抽屉
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/image1.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                'Drawer heading',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
