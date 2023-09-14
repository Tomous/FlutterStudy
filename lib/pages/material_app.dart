import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/gitHubApp/github_app.dart';
import 'package:flutter_study/goodHouseApp/pages/login.dart';

class MaterialAppPage extends StatelessWidget {
  const MaterialAppPage({super.key});
  static const _itemList = [
    {
      'title': 'Github 客户端',
      'content':
          '1、实现Github账号登录、退出登录功能\n2、登录后可以查看自己的项目主页\n3、支持换肤\n4、支持多语言\n5、登录状态可以持久化',
      'page': GithubAppPage(),
    },
    {
      'title': '好客房APP',
      'content': '333333333',
      'page': LoginPage(),
    },
    {
      'title': '33333',
      'content': '333333333',
      'page': GithubAppPage(),
    },
    {
      'title': '33333',
      'content': '333333333',
      'page': GithubAppPage(),
    },
    {
      'title': '33333',
      'content': '333333333',
      'page': GithubAppPage(),
    },
    {
      'title': '33333',
      'content': '333333333',
      'page': GithubAppPage(),
    },
    {
      'title': '33333',
      'content': '333333333',
      'page': GithubAppPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 208, 195, 194),
        child: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(
                  _itemList[index]['title'].toString(),
                  style: titleStyle(),
                ),
                subtitle: Text(
                  _itemList[index]['content'].toString(),
                  style: subTitleStyle(),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _itemList[index]['page'] as Widget),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
