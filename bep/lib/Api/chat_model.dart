class MessageModel {
  final String id;
  final String content;

  MessageModel({this.id = '', this.content = ''});

  factory MessageModel.fromMap(
      {required String id, required Map<String, dynamic> map}) {
    return MessageModel(
      id: id,
      content: map['content'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['content'] = content;
    return data;
  }
}
