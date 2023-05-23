import 'package:flutter/material.dart';

class PostChatStatus extends StatefulWidget {
  @override
  State<PostChatStatus> createState() => _PostChatStatusState();
}

class _PostChatStatusState extends State<PostChatStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(),
    );
  }
}
