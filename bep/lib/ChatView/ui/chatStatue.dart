import 'package:flutter/material.dart';

class ChatStatus extends StatefulWidget {
  @override
  State<ChatStatus> createState() => _ChatStatusState();
}

class _ChatStatusState extends State<ChatStatus> {
  List<String> posts = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void addPost() {
    String post = textEditingController.text;
    if (post.isNotEmpty) {
      setState(() {
        posts.add(post);
        textEditingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Please enter your comments',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), // 밑줄의 색을 설정
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: addPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(10, 151, 217, 1),
                  ),
                  child: Text(
                    'Go',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
