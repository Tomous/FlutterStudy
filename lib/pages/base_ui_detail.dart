import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseUIDetailPage extends StatelessWidget {
  final String title;
  const BaseUIDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildWidgetPageWithTag(title),
    );
  }
}

Widget buildWidgetPageWithTag(String title) {
  switch (title) {
    case '文本样式-Text':
      return const TextUIPage();
    case '按钮-Button':
      return const ButtonUIPage();
    case '图片及Icon':
      return const ImageUIPage();
    case '单选开关和复选框':
      return const ChooseUIPage();
    case '输入框及表单':
      return const InputAndFormUIPage();
    case '进度指示器':
      return const IndicatorUIPage();
    default:
      return const TextUIPage();
  }
}

/*
  文本样式-Text
*/
class TextUIPage extends StatelessWidget {
  const TextUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  'Text',
                  style: titleColorStyle(Colors.blue),
                ),
                subtitle: Text(
                  '用于显示简单样式文本，它包含一些控制文本显示样式的一些属性',
                  style: subTitleStyle(),
                ),
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://book.flutterchina.club/chapter3/text.html'));
                },
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'textAlign',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget 本身。本例中虽然是指定了居中对齐，但因为 Text 文本内容宽度不足一行，Text 的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，只有 Text 宽度大于文本内容长度时指定此属性才有意义',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'maxLines',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '默认情况下，文本是自动折行的，如果指定此参数，则文本最多不会超过指定的行',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'overflow',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断，本例中指定的截断方式TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'strutStyle',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '控制文本的行高和基线对齐方式。通过设置strutStyle，您可以调整文本在行高和基线对齐方面的表现',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'locale',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '特定地区或语言环境的设置:通常与MaterialApp或WidgetsApp的locale属性一起使用，以设置应用程序的默认本地化配置\nlocale: const Locale('
                  'en'
                  ', '
                  'US'
                  ')',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'softWrap',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '指定文本是否应该在达到行宽限制时自动换行',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'semanticsLabel',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '用于提供辅助功能的属性，用于描述小部件的可访问性标签。它用于为屏幕阅读器或其他辅助技术提供有关小部件的信息，以帮助用户理解界面上的内容',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: const [
                  Text(
                    '事例：',
                    semanticsLabel: 'semanticsLabel',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'textScaleFactor',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'TextStyle',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '用于指定文本显示的样式如颜色、字体、粗细、背景等',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'TextSpan',
                  style: titleStyle(),
                ),
                subtitle: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '如果我们需要对一个 Text 内容的不同部分按照不同的样式显示，这时就可以使用TextSpan,',
                      ),
                      TextSpan(
                        text: '比如这段话，就是一个富文本（Text.rich）',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '还可以加个手势recognizer，点击触发方法',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'DefaultTextStyle',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '在 Widget 树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用 Widget 树中父级设置的默认样式），因此，如果在 Widget 树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式',
                  style: subTitleStyle(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  '字体：自定义字体，或者其他第三方的字体',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '1、在asset中声明\n2、使用字体',
                  style: subTitleStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  按钮-Button
*/
class ButtonUIPage extends StatelessWidget {
  const ButtonUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'ElevatedButton',
                  style: titleColorStyle(Colors.blue),
                ),
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://book.flutterchina.club/chapter3/buttons.html#_3-2-1-elevatedbutton'));
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('normal'),
              ),
              ListTile(
                title: Text(
                  'TextButton',
                  style: titleStyle(),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  'OutlinedButton',
                  style: titleStyle(),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'OutlinedButton',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  'IconButton',
                  style: titleStyle(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              ListTile(
                title: Text(
                  '带图标的按钮:',
                  style: titleStyle(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('发送'),
                    icon: const Icon(Icons.send),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('添加'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                    label: const Text('详情'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
  图片及ICON
*/
class ImageUIPage extends StatelessWidget {
  const ImageUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: IntrinsicHeight(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'ImageProvider:',
                  style: titleColorStyle(Colors.blue),
                ),
                subtitle: Text(
                  '一个抽象类，主要定义了图片数据获取的接口load()，从不同的数据源获取图片需要实现不同的ImageProvider ，如AssetImage是实现了从Asset中加载图片的 ImageProvider，而NetworkImage 实现了从网络加载图片的 ImageProvider',
                  style: subTitleStyle(),
                ),
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://book.flutterchina.club/chapter3/img_and_icon.html#_3-3-1-%E5%9B%BE%E7%89%87'));
                },
              ),
              ListTile(
                title: Text(
                  'Image:',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  'Image widget 有一个必选的image参数，它对应一个 ImageProvider。下面我们分别演示一下如何从 asset 和网络加载图片',
                  style: subTitleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  '从asset中加载图片:',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '1：image: AssetImage("images/avatar.png")\n2：Image.asset("images/avatar.png",)',
                  style: subTitleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  '从网络加载图片:',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '1：image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4")\n2：Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",)',
                  style: subTitleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  'color和 colorBlendMode',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式',
                  style: subTitleStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      '图片缓存',
                      style: titleStyle(),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('图片缓存'),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Colors.blue、BlendMode.difference',
                  style: subTitleStyle(),
                ),
              ),
              Image.asset(
                'assets/images/image3.jpeg',
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
              ),
              ListTile(
                title: Text(
                  'repeat',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '当图片本身大小小于显示空间时，指定图片的重复规则',
                  style: subTitleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  'ImageRepeat.repeatY',
                  style: subTitleStyle(),
                ),
              ),
              Image.asset(
                'assets/images/image3.jpeg',
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
              ListTile(
                title: Text(
                  'Fit属性:',
                  style: titleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  'fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      height: 50,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    const Text('BoxFit.fill'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      width: 100,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    const Text('BoxFit.cover'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    const Text('BoxFit.contain'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      width: 100,
                      height: 50,
                      fit: BoxFit.fitWidth,
                    ),
                    const Text('BoxFit.fitWidth'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      width: 100,
                      height: 50,
                      fit: BoxFit.fitHeight,
                    ),
                    const Text('BoxFit.fitHeight'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分',
                  style: subTitleStyle(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.jpeg',
                      width: 100,
                      height: 50,
                      fit: BoxFit.none,
                    ),
                    const Text('BoxFit.none'),
                  ],
                ),
              ),
              const Divider(
                height: 50,
              ),
              Text(
                'ICON',
                style: titleStyle(),
              ),
              ListTile(
                title: Text(
                  'iconfont和图片相比有如下优势：',
                  style: titleStyle(),
                ),
                subtitle: Text(
                  '1、体积小：可以减小安装包大小。\n2、矢量的：iconfont都是矢量图标，放大不会影响其清晰度\n3、可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等\n4、可以通过TextSpan和文本混用\n',
                  style: subTitleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  '使用Material Design字体图标',
                  style: titleStyle(),
                ),
              ),
              ListTile(
                title: Text(
                  '使用自定义字体图标',
                  style: titleStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
  单选开关和复选框
*/
class ChooseUIPage extends StatefulWidget {
  const ChooseUIPage({super.key});

  @override
  State<ChooseUIPage> createState() => _ChooseUIPageState();
}

class _ChooseUIPageState extends State<ChooseUIPage> {
  bool _switchSelected = false; //维护单选开关状态
  bool _checkboxSelected = false; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Material 组件库中提供了 Material 风格的单选开关Switch和复选框Checkbox，虽然它们都是继承自StatefulWidget，但它们本身不会保存当前选中状态，选中状态都是由父组件来管理的。当Switch或Checkbox被点击时，会触发它们的onChanged回调，我们可以在此回调中处理选中状态改变逻辑',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ListTile(
                    title: Text(
                      'switch',
                      style: titleStyle(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(
                          'https://book.flutterchina.club/chapter3/radio_and_checkbox.html'),
                    );
                  },
                  child: const Text('点击查看详情'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                    Fluttertoast.showToast(
                      msg: !_switchSelected ? '开关关闭' : '开关打开',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value!;
                    });
                    Fluttertoast.showToast(
                      msg: _checkboxSelected ? '选中了' : '取消选中',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: Text(
                '属性及外观',
                style: titleStyle(),
              ),
            ),
            const Expanded(
              child: ListTile(
                title: Text(
                  'Switch和Checkbox属性比较简单，读者可以查看API文档，它们都有一个activeColor属性，用于设置激活态的颜色。至于大小，到目前为止，Checkbox的大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。值得一提的是Checkbox有一个属性tristate ，表示是否为三态，其默认值为false ，这时 Checkbox 有两种状态即“选中”和“不选中”，对应的 value 值为true和false ；如果tristate值为true时，value 的值会增加一个状态null',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  输入框及表单
*/
class InputAndFormUIPage extends StatefulWidget {
  const InputAndFormUIPage({super.key});

  @override
  State<InputAndFormUIPage> createState() => _InputAndFormUIPageState();
}

class _InputAndFormUIPageState extends State<InputAndFormUIPage> {
  final TextEditingController _unameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: ListTile(
                  title: Text(
                    'TextField',
                    style: titleColorStyle(Colors.blue),
                  ),
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield'));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield'));
                },
                child: const Text('点击查看详情'),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('controller：',
                '编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。大多数情况下我们都需要显式提供一个controller来与文本框交互。如果没有提供controller，则TextField内部会自动创建一个'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('focusNode',
                '用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个句柄（handle）'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'InputDecoration', '用于控制TextField的外观显示，如提示文本、背景颜色、边框等'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('keyboardType', '用于设置该输入框默认的键盘输入类型'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'textInputAction', '键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('style', '正在编辑的文本样式'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('textAlign', '输入框内编辑文本在水平方向的对齐方式'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('autofocus', '是否自动获取焦点'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'obscureText', '是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'maxLines', '输入框的最大行数，默认为1；如果为null，则无行数限制'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('maxLength和maxLengthEnforcement',
                'maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。maxLengthEnforcement决定当输入文本长度超过maxLength时如何处理，如截断、超出等'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('toolbarOptions',
                '长按或鼠标右击时出现的菜单，包括 copy、cut、paste 以及 selectAll'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'onChange', '输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('onEditingComplete和onSubmitted',
                '这两个回调都是在输入框输入完成时触发，比如按了键盘的完成键（对号图标）或搜索键（🔍图标）。不同的是两个回调签名不同，onSubmitted回调是ValueChanged<String>类型，它接收当前输入内容做为参数，而onEditingComplete不接收参数'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'inputFormatters：', '用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('enable：',
                '如果为false，则输入框会被禁用，禁用状态不能响应输入和事件，同时显示禁用态样式（在其decoration中定义）'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('cursorWidth、cursorRadius和cursorColor：',
                '这三个属性是用于自定义输入框光标宽度、圆角和颜色的'),
          ),
        ),
        ListTile(
          title: Text(
            '示例：登录输入框',
            style: titleStyle(),
          ),
        ),
        TextField(
          autofocus: false,
          controller: _unameController,
          decoration: const InputDecoration(
            labelText: '用户名：',
            hintText: '请输入用户名或邮箱',
            prefixIcon: Icon(Icons.person),
          ),
          onSubmitted: (text) {
            Fluttertoast.showToast(msg: '输入的用户名是：${_unameController.text}');
          },
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            '获取输入内容',
            style: titleStyle(),
          ),
          subtitle: Text(
            '获取Textfield里面的值，可以通过onChange方法，也可以通过传递Controller的方法：controller.text',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            '监听文本变化',
            style: titleStyle(),
          ),
          subtitle: Text(
            '1：设置onChange回调\nonChanged: (v) {print("onChange: 具体内容");}\n2：通过controller监听\nvoid initState() {_controller.addListener((){print(_unameController.text);});}',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            '控制焦点',
            style: titleStyle(),
          ),
          subtitle: Text(
            '焦点可以通过FocusNode和FocusScopeNode来控制，默认情况下，焦点由FocusScope来管理，它代表焦点控制范围，可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、设置默认焦点等。我们可以通过FocusScope.of(context) 来获取Widget树中默认的FocusScopeNode',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            '监听焦点状态改变事件',
            style: titleStyle(),
          ),
          subtitle: Text(
            'FocusNode继承自ChangeNotifier，通过FocusNode可以监听焦点的改变事件',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListTile(
                  title: Text(
                    '表单Form',
                    style: titleStyle(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                        'https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-2-%E8%A1%A8%E5%8D%95form'),
                  );
                },
                child: const Text('点击查看详情'),
              ),
            ],
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            'Form',
            style: titleStyle(),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('autovalidate',
                '是否自动校验输入内容；当为true时，每一个子 FormField 内容发生变化时都会自动校验合法性，并直接显示错误信息。否则，需要通过调用FormState.validate()来手动校验'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('onWillPop',
                '决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，如果 Future 的最终结果是false，则当前路由不会返回；如果为true，则会返回到上一个路由。此属性通常用于拦截返回按钮'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'onChanged', 'Form的任意一个子FormField内容发生变化时会触发此回调'),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            'FormField',
            style: titleStyle(),
          ),
          subtitle: Text(
            'Form的子孙元素必须是FormField类型，FormField是一个抽象类，定义几个属性，FormState内部通过它们来完成操作',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            'FormState',
            style: titleStyle(),
          ),
          subtitle: Text(
            'FormState为Form的State类，可以通过Form.of()或GlobalKey获得。我们可以通过它来对Form的子孙FormField进行统一操作。我们看看其常用的三个方法：',
            style: subTitleStyle(),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('FormState.validate()：',
                '调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('FormState.save()',
                '调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle(
                'FormState.reset()', '调用此方法后，会将子孙FormField的内容清空'),
          ),
        ),
        const Divider(height: 40),
        ListTile(
          title: Text(
            '示例',
            style: titleStyle(),
          ),
          subtitle: Text(
            '1、用户名不能为空，如果为空则提示“用户名不能为空”\n2、密码不能少于 6 位，如果小于 6 为则提示“密码不能少于 6 位”',
            style: subTitleStyle(),
          ),
        ),
        const Divider(height: 20),
        const FormTestRoute(),
      ],
    );
  }
}

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({super.key});

  @override
  State<FormTestRoute> createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode:
          AutovalidateMode.onUserInteraction, //表单字段将在用户与其进行交互时自动进行验证
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: false, //是否自动获取焦点
            controller: _userNameController,
            decoration: const InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名或邮箱',
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
              labelText: '密码',
              hintText: '您的登录密码',
              icon: Icon(Icons.lock),
            ),
            obscureText: true, //将文本内容隐藏
            validator: (v) {
              return v!.trim().length > 5 ? null : '密码不能少于6位';
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 通过_formKey.currentState 获取FormState后，
                    // 调用validate()方法校验用户名密码是否合法，校验
                    // 通过后再提交数据。
                    if ((_formKey.currentState as FormState).validate()) {
                      //验证通过提交数据
                      Fluttertoast.showToast(
                        msg: '数据校验通过，进入登陆页面',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('登陆'),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class IndicatorUIPage extends StatefulWidget {
  const IndicatorUIPage({super.key});

  @override
  State<IndicatorUIPage> createState() => _IndicatorUIPageState();
}

/*
  进度指示器
*/
class _IndicatorUIPageState extends State<IndicatorUIPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            '进度指示器',
            style: titleColorStyle(Colors.blue),
          ),
          subtitle: Text(
            'Material 组件库中提供了两种进度指示器：LinearProgressIndicator和CircularProgressIndicator，它们都可以同时用于精确的进度指示和模糊的进度指示。精确进度通常用于任务进度可以计算和预估的情况，比如文件下载；而模糊进度则用户任务进度无法准确获得的情况，如下拉刷新，数据提交等',
            style: subTitleStyle(),
          ),
          onTap: () {
            launchUrl(
              Uri.parse(
                  'https://book.flutterchina.club/chapter3/progress.html#_3-6-1-linearprogressindicator'),
            );
          },
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            'LinearProgressIndicator',
            style: titleStyle(),
          ),
          subtitle: Text(
            'LinearProgressIndicator是一个线性、条状的进度条',
            style: subTitleStyle(),
          ),
        ),
        ListTile(
          title: Text(
            '进度条显示50%',
            style: subTitleStyle(),
          ),
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          value: .6,
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('value',
                '表示当前的进度，取值范围为[0,1],如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('backgroundColor', '指示器的背景色'),
          ),
        ),
        ListTile(
          title: Text.rich(
            textSpanTitleAndSubTitle('valueColor',
                '指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定'),
          ),
        ),
        const Divider(height: 20),
        ListTile(
          title: Text(
            'CircularProgressIndicator',
            style: titleStyle(),
          ),
          subtitle: Text(
            '是一个圆形进度条',
            style: subTitleStyle(),
          ),
        ),
        ListTile(
          title: Text(
            '不设置进度条',
            style: subTitleStyle(),
          ),
        ),
        Container(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      ],
    );
  }
}
