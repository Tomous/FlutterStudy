import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HttpClientPage extends StatelessWidget {
  final String title;
  const HttpClientPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          dcListTitleAndSubTitle(
            '文件操作',
            '1、临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除临时目录的文件。在 iOS 上，这对应于NSTemporaryDirectory() (opens new window)返回的值。在 Android上，这是getCacheDir() (opens new window)返回的值\n2、文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。在 iOS 上，这对应于NSDocumentDirectory。在 Android 上，这是AppData目录\n3、外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如 SD 卡；由于 iOS不支持外部目录，所以在 iOS 下调用该方法会抛出UnsupportedError异常，而在 Android 下结果是Android SDK 中getExternalStorageDirectory的返回值\n通过HttpClient发起HTTP请求\n',
            true,
            () {
              launchUrlString(
                'https://book.flutterchina.club/chapter11/file_operation.html',
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      'https://book.flutterchina.club/chapter11/dio.html#_11-3-1-%E5%BC%95%E5%85%A5dio',
                    );
                  },
                  child: const Text('Http请求库-dio'),
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      'https://book.flutterchina.club/chapter11/download_with_chunks.html#_11-4-1-http%E5%88%86%E5%9D%97%E4%B8%8B%E8%BD%BD%E5%8E%9F%E7%90%86',
                    );
                  },
                  child: const Text('Http分块下载'),
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      'https://book.flutterchina.club/chapter11/websocket.html#_11-5-1-%E9%80%9A%E4%BF%A1%E6%AD%A5%E9%AA%A4',
                    );
                  },
                  child: const Text('使用WebSockets'),
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      'https://book.flutterchina.club/chapter11/socket.html#_11-6-1-socket-%E7%AE%80%E4%BB%8B',
                    );
                  },
                  child: const Text('使用Socket API'),
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                      'https://book.flutterchina.club/chapter11/json_model.html#_11-7-1-json%E8%BD%ACdart%E7%B1%BB',
                    );
                  },
                  child: const Text('JSON转Dart Model类'),
                ),
                const ListTile(
                  title: Text(
                      '使用json_model和json_serializable\n\n1、在工程根目录下创建一个名为 "jsons" 的目录\n2、创建或拷贝Json文件到"jsons" 目录中\n3、运行 pub run json_model (Dart VM工程)or flutter packages pub run json_model(Flutter中) 命令生成Dart model类，生成的文件默认在"lib/models"目录下\n\n详情请看pub.dev中json_model的介绍'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 获取Github开放的API来请求flutterchina组织下的所有公开的开源项目
 */
class GetAllFlutterAPIFromFlutterChina extends StatefulWidget {
  const GetAllFlutterAPIFromFlutterChina({super.key});

  @override
  State<GetAllFlutterAPIFromFlutterChina> createState() =>
      _GetAllFlutterAPIFromFlutterChinaState();
}

class _GetAllFlutterAPIFromFlutterChinaState
    extends State<GetAllFlutterAPIFromFlutterChina> {
  Dio _dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: snapshot.error.toString());
              return Text(snapshot.error.toString());
            }
            //请求成功，通过项目信息构建用于显示项目名称的ListView
            return ListView(
              children: response.data.map(
                (e) {
                  return ListTile(
                    title: Text(e['full_name']),
                  );
                },
              ).toList,
            );
          }
          //请求未完成时弹出loading
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
