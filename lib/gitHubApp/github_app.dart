import 'package:flutter/material.dart';

class GithubAppPage extends StatefulWidget {
  const GithubAppPage({super.key});

  @override
  State<GithubAppPage> createState() => _GithubAppPageState();
}

class _GithubAppPageState extends State<GithubAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github 客户端'),
      ),
    );
  }
}
