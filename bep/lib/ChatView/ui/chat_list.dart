import 'dart:developer';

import 'package:bep/ChatView/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_stream.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: StreamBuilder<List<MessageModel>>(
        stream: streamMessages(),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return const Center(
              child: Text('오류가 발생했습니다.'),
            );
          } else {
            List<MessageModel> messages = asyncSnapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Container(
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(messages[index].content),
                              ),
                            ),
                            subtitle: Text(messages[index]
                                .sendDate
                                .toDate()
                                .toLocal()
                                .toString()
                                .substring(5, 16)),
                          );
                        })),
                getInputWidget()
              ],
            );
          }
        },
      ),
    );
  }

  Widget getInputWidget() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, -2), blurRadius: 3)
      ], color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15),
                  labelText: "내용을 입력하세요..",
                  fillColor: Colors.black26,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: _onPressedSendButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(10, 151, 217, 1),
              ),
              child: Text(
                'Go',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onPressedSendButton() {
    try {
      MessageModel messageModel =
          MessageModel(content: controller.text, sendDate: Timestamp.now());

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore
          .collection('chatrooms/34Oo2JN3tOF1P3ktOBMC/messages')
          .add(messageModel.toMap());
    } catch (ex) {
      log('error)', error: ex.toString(), stackTrace: StackTrace.current);
    }
  }
}
