import 'dart:developer';

import 'package:bep/ChatView/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<MessageModel>> streamMessages() {
  try {
    final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
        .collection('chatrooms/34Oo2JN3tOF1P3ktOBMC/messages')
        .orderBy('sendDate')
        .snapshots();

    return snapshots.map((querySnapshot) {
      List<MessageModel> messages = [];
      querySnapshot.docs.forEach((element) {
        messages.add(MessageModel.fromMap(
            id: element.id, map: element.data() as Map<String, dynamic>));
      });
      return messages;
    });
  } catch (ex) {
    log('error)', error: ex.toString(), stackTrace: StackTrace.current);
    return Stream.error(ex.toString());
  }
}
