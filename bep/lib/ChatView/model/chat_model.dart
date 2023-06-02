import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String content;
  final Timestamp sendDate;

  MessageModel({
    this.id = '',
    this.content = '',
    Timestamp? sendDate,
  }) : sendDate = sendDate ?? Timestamp(0, 0);

  //서버로부터 map형태의 자료를 MessageModel형태의 자료로 변환해주는 역할을 수행함.
  factory MessageModel.fromMap(
      {required String id, required Map<String, dynamic> map}) {
    return MessageModel(
        id: id,
        content: map['content'] ?? '',
        sendDate: map['sendDate'] ?? Timestamp(0, 0));
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['content'] = content;
    data['sendDate'] = sendDate;
    return data;
  }
}

// class ChatRoom {
//   String id;
//   ChatMember writer;
//   ChatMember content;
//   List<Message> messages;

//   ChatRoom(
//       {required this.id,
//       required this.writer,
//       required this.content,
//       required this.messages});

//   factory ChatRoom.fromJson(Map<dynamic, dynamic> jsonMap) {
//     return ChatRoom(
//         id: jsonMap['id'],
//         writer: jsonMap['writer'].map((writer) => ChatMember.fromJson(writer)),
//         content:
//             jsonMap['content'].map((content) => ChatMember.fromJson(content)),
//         messages: jsonMap['messages']
//             .map((messages) => Message.fromJson(messages))
//             .toList());
//   }

//   Map<dynamic, dynamic> toJson() {
//     return {
//       'id': id,
//       'writer': writer.toJson(),
//       'contact': content.toJson(),
//       'messages': messages.map((message) => message.toJson()).toList()
//     };
//   }

//   factory ChatRoom.fromDocumentSnapshot(DocumentSnapshot snapshot) {
//     final List<Message> message = [];
//     final messageSnapshot = List<Map>.from(snapshot['messages'] as List);
//     for (var i in messageSnapshot) {
//       message.add(Message.fromJson(i as Map<String, dynamic>));
//     }
//     return ChatRoom(
//         id: snapshot['id'],
//         writer: ChatMember.fromJson(snapshot['writer'] as Map<String, dynamic>),
//         content:
//             ChatMember.fromJson(snapshot['content'] as Map<String, dynamic>),
//         messages: message);
//   }
// }

// class ChatMember {
//   String name;
//   String id;

//   ChatMember({required this.name, required this.id});

//   factory ChatMember.fromJson(Map<String, dynamic> jsonMap) {
//     return ChatMember(name: jsonMap['name'], id: jsonMap['id']);
//   }

//   toJson() {
//     return {
//       'name': name,
//       'id': id,
//     };
//   }
// }

// class Message {
//   String content;
//   String sender;
//   String createAt;

//   Message(
//       {required this.content, required this.sender, required this.createAt});

//   factory Message.fromJson(Map<String, dynamic> jsonMap) {
//     return Message(
//         content: jsonMap['content'],
//         sender: jsonMap['sender'],
//         createAt: jsonMap['createAt']);
//   }

//   toJson() {
//     return {
//       'content': content,
//       'sender': sender,
//       'createAt': createAt,
//     };
//   }
// }
