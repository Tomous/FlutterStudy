import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LayoutUIDetailPage extends StatelessWidget {
  final String title;
  const LayoutUIDetailPage({super.key, required this.title});

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

Widget _buildWidgetWithTag(String tag) {
  switch (tag) {
    case 'BoxConstraints':
    case 'ConstrainedBox':
    case 'SizedBox':
    case '多重限制':
    case 'UnconstrainedBox':
      return const BoxConstraintsUIPage();
    case '主轴和纵轴':
    case 'Row':
    case 'Column':
    case '特殊情况':
      return const RowAndColumnPage();
    case 'Flex':
    case 'Expanded':
      return const FlexUIPage();
    case 'Wrap':
    case 'Flow':
      return const WrapAndFlowUIPage();
    case 'Stack':
    case 'Positioned':
      return const StackAndPositionedUIPage();
    case 'Align':
    case 'Align和Stack对比':
    case 'Center组件':
      return const AlignUIPage();
    case 'LayoutBuilder':
    case 'AfterLayout':
    case 'build和layout':
      return const LayoutBuilderAndAfterLayoutPage();
    default:
      return Container();
  }
}

/*
   布局原理与约束（constraints）
*/
class BoxConstraintsUIPage extends StatelessWidget {
  const BoxConstraintsUIPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Flutter布局模型',
                style: titleColorStyle(Colors.blue),
              ),
              subtitle: Text(
                'Flutter 中有两种布局模型：\n1、基于 RenderBox 的盒模型布局。\n2、基于 Sliver ( RenderSliver ) 按需加载列表布局',
                style: subTitleStyle(),
              ),
              onTap: () {
                launchUrl(
                  Uri.parse(
                      'https://book.flutterchina.club/chapter4/constraints.html#_4-2-1-flutter%E5%B8%83%E5%B1%80%E6%A8%A1%E5%9E%8B'),
                );
              },
            ),
            const Divider(height: 10),
            ListTile(
              title: Text(
                'BoxConstraints',
                style: titleStyle(),
              ),
              subtitle: Text(
                'BoxConstraints 是盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，包含最大宽高信息，子组件大小需要在约束的范围内',
                style: subTitleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('minWidth', '最小宽度'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('maxWidth', '最大宽度'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('minHeight', '最小高度'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('maxHeight', '最大高度'),
              ),
            ),
            const Divider(height: 10),
            dcListTitleAndSubTitle(
                'ConstrainedBox',
                'ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束',
                false,
                () => null),
            const Divider(height: 10),
            dcListTitleAndSubTitle(
                'SizedBox', 'SizedBox用于给子元素指定固定的宽高', false, () => null),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.red,
              ),
            ),
            const Divider(
              height: 10,
            ),
            dcListTitleAndSubTitle(
                '多重限制',
                '如果某一个组件有多个父级ConstrainedBox限制，那么最终会是取父子中相应数值较大的值',
                false,
                () => null),
            const Divider(
              height: 10,
            ),
            dcListTitleAndSubTitle(
              'UnconstrainedBox',
              'UnconstrainedBox 的子组件将不再受到约束，大小完全取决于自己,在"去除"多重限制的时候使用',
              true,
              () => launchUrl(
                Uri.parse(
                    'https://book.flutterchina.club/chapter4/constraints.html#_4-2-6-unconstrainedbox'),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                '其他约束类容器',
                style: titleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('AspectRatio', '指定子组件的长宽比'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('LimitedBox', '指定最大宽高'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle(
                    'FractionallySizedBox', '根据父容器宽高的百分比来设置子组件宽高'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
   线性布局（Row和Column）
*/
class RowAndColumnPage extends StatelessWidget {
  const RowAndColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              '线性布局（Row和Column）',
              '对于线性布局，有主轴和纵轴之分，如果布局是沿水平方向，那么主轴就是指水平方向，而纵轴即垂直方向；如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。在线性布局中，有两个定义对齐方式的枚举类MainAxisAlignment和CrossAxisAlignment，分别代表主轴对齐和纵轴对齐',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/row_and_column.html#_4-3-1-%E4%B8%BB%E8%BD%B4%E5%92%8C%E7%BA%B5%E8%BD%B4')),
            ),
            ListTile(
              title: Text(
                'Row',
                style: titleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle(
                    'textDirection', '表示水平方向子组件的布局顺序(是从左往右还是从右往左)'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('mainAxisSize',
                    '表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的水平空间'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('mainAxisAlignment',
                    '表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，MainAxisAlignment.start表示沿textDirection的初始方向对齐，如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，textDirection取值为TextDirection.rtl时表示从右对齐。而MainAxisAlignment.end和MainAxisAlignment.start正好相反；MainAxisAlignment.center表示居中对齐'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('verticalDirection',
                    '表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('crossAxisAlignment',
                    '表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，不同的是crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；而crossAxisAlignment.end和crossAxisAlignment.start正好相反'),
              ),
            ),
            dcListTitleAndSubTitle(
              'Column',
              'Column可以在垂直方向排列其子组件。参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/row_and_column.html#_4-3-2-row')),
            ),
            dcListTitleAndSubTitle(
              '特殊情况',
              '如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/row_and_column.html#_4-3-4-%E7%89%B9%E6%AE%8A%E6%83%85%E5%86%B5')),
            ),
          ],
        ),
      ),
    );
  }
}

/*
   弹性布局（Flex）
*/
class FlexUIPage extends StatelessWidget {
  const FlexUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              '弹性布局（Flex）',
              '弹性布局允许子组件按照一定比例来分配父容器空间',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/flex.html#_4-4-1-flex')),
            ),
            ListTile(
              title: Text(
                'Flex',
                style: titleStyle(),
              ),
              subtitle: Text(
                'Flex组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用Row或Column会方便一些，因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column',
                style: subTitleStyle(),
              ),
            ),
            ListTile(
              title: Text(
                'Expanded',
                style: titleStyle(),
              ),
              subtitle: Text(
                'Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间',
                style: subTitleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('flex',
                    '弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间'),
              ),
            ),
            ListTile(
              title: Text(
                '黄色的容器flex为2',
                style: titleStyle(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
   流式布局（Wrap、Flow）
*/
class WrapAndFlowUIPage extends StatelessWidget {
  const WrapAndFlowUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              '流式布局（Wrap、Flow）',
              '在使用Row 和 Column 时，如果子 widget 超出屏幕范围，则会报溢出错误,因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/wrap_and_flow.html#_4-5-1-wrap')),
            ),
            ListTile(
              title: Text(
                'Wrap',
                style: titleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('spacing', '主轴方向子widget的间距'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('runSpacing', '纵轴方向的间距'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('runAlignment', '纵轴方向的对齐方式'),
              ),
            ),
            ListTile(
              title: Text(
                '示例',
                style: titleStyle(),
              ),
              subtitle: Text(
                '1、spacing主轴(水平)方向间距\n2、runSpacing纵轴（垂直）方向间距\n3、alignment：沿主轴方向居左',
                style: subTitleStyle(),
              ),
            ),
            Wrap(
              spacing: 8.0, //主轴(水平)方向间距
              runSpacing: 4.0, //纵轴（垂直）方向间距
              alignment: WrapAlignment.start, //沿主轴方向居中
              children: const [
                Chip(
                  label: Text('Hamilton'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Lafayette'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('M'),
                  ),
                ),
                Chip(
                  label: Text('Mulligan'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('H'),
                  ),
                ),
                Chip(
                  label: Text('Laurens'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('J'),
                  ),
                ),
              ],
            ),
            dcListTitleAndSubTitle(
              'Flow',
              '很少会使用,因为其过于复杂，需要自己实现子 widget 的位置转换，具体点击查看详情介绍',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/wrap_and_flow.html#_4-5-2-flow')),
            ),
          ],
        ),
      ),
    );
  }
}

/*
   层叠布局（Stack、Positioned）
*/
class StackAndPositionedUIPage extends StatelessWidget {
  const StackAndPositionedUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              '层叠布局（Stack、Positioned）',
              '子组件可以根据距父容器四个角的位置来确定自身的位置。层叠布局允许子组件按照代码中声明的顺序堆叠起来。Flutter中使用Stack和Positioned这两个组件来配合实现绝对定位。Stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置',
              true,
              () => launchUrl(Uri.parse(
                  'https://book.flutterchina.club/chapter4/stack.html')),
            ),
            ListTile(
              title: Text(
                'Stack',
                style: titleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(textSpanTitleAndSubTitle('alignment',
                  '此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位')),
            ),
            ListTile(
              title: Text.rich(textSpanTitleAndSubTitle('textDirection',
                  '确定alignment对齐的参考系,textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序')),
            ),
            ListTile(
              title: Text.rich(textSpanTitleAndSubTitle('fit',
                  '此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小')),
            ),
            ListTile(
              title: Text.rich(textSpanTitleAndSubTitle('clipBehavior',
                  '此属性决定对超出Stack显示空间的部分如何剪裁，Clip枚举类中定义了剪裁的方式，Clip.hardEdge 表示直接剪裁，不应用抗锯齿')),
            ),
            ListTile(
              title: Text(
                'Positioned',
                style: titleStyle(),
              ),
              subtitle: Text(
                'left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。width和height用于指定需要定位元素的宽度和高度。注意，Positioned的width、height 和其他地方的意义稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件，举个例子，在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理',
                style: subTitleStyle(),
              ),
            ),
            ElevatedButton(
                onPressed: () => launchUrlString(
                    'https://book.flutterchina.club/chapter4/stack.html#_4-6-3-%E7%A4%BA%E4%BE%8B'),
                child: const Text('示例')),
          ],
        ),
      ),
    );
  }
}

/*
   对齐与相对定位（Align）
*/
class AlignUIPage extends StatelessWidget {
  const AlignUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              '对齐与相对定位（Align）',
              '',
              true,
              () => launchUrlString(
                  'https://book.flutterchina.club/chapter4/alignment.html#_4-7-1-align'),
            ),
            ListTile(
              title: Text(
                'Align',
                style: titleStyle(),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('alignment',
                    '需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('widthFactor和heightFactor',
                    '用于确定Align 组件本身宽高的属性；它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间'),
              ),
            ),
            Container(
              color: Colors.blue.shade50,
              width: 120.0,
              height: 120.0,
              child: const Align(
                alignment: Alignment.topRight,
                widthFactor:
                    4, //如果Container的宽没有设置，那么Container的宽就是60*4，如果设置了，这个则不生效
                heightFactor: 4, //同宽
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('Align和Stack对比',
                    '可以看到，Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别：\n1、定位参考系统不同；Stack/Positioned定位的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。\n2、Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠'),
              ),
            ),
            ListTile(
              title: Text.rich(
                textSpanTitleAndSubTitle('Center组件',
                    'Center继承自Align,其实是对齐方式确定（Alignment.center）了的Align'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
   LayoutBuilder、AfterLayout
*/
class LayoutBuilderAndAfterLayoutPage extends StatelessWidget {
  const LayoutBuilderAndAfterLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            dcListTitleAndSubTitle(
              'LayoutBuilder',
              '通过 LayoutBuilder，我们可以在布局过程中拿到父组件传递的约束信息，然后我们可以根据约束信息动态的构建不同的布局',
              true,
              () => launchUrlString(
                  'https://book.flutterchina.club/chapter4/layoutbuilder.html#_4-8-1-layoutbuilder'),
            ),
            ListTile(
              title: Text(
                '使用场景',
                style: titleStyle(),
              ),
              subtitle: Text(
                '1、可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局\n2、LayoutBuilder 可以帮我们高效排查问题。比如我们在遇到布局问题或者想调试组件树中某一个节点布局的约束时 LayoutBuilder 就很有用',
                style: subTitleStyle(),
              ),
            ),
            dcListTitleAndSubTitle(
              '打印布局时的约束信息',
              '为了便于排错，我们封装一个能打印父组件传递给子组件约束的组件',
              true,
              () => launchUrlString(
                  'https://book.flutterchina.club/chapter4/layoutbuilder.html#_4-8-1-layoutbuilder'),
            ),
            dcListTitleAndSubTitle(
              'AfterLayout',
              '详细介绍点击查看',
              true,
              () => launchUrlString(
                  'https://book.flutterchina.club/chapter4/layoutbuilder.html#_4-8-2-afterlayout'),
            ),
          ],
        ),
      ),
    );
  }
}
