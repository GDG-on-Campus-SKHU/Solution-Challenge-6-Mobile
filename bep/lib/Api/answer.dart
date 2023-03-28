class Answer {
  final String question;
  final String category;
  final String content;
  final String imgUrl;
  final int userPoint;

  Answer(
      {required this.question,
      required this.category,
      required this.content,
      required this.imgUrl,
      required this.userPoint});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
        question: json['question'],
        category: json['category'],
        content: json['content'],
        imgUrl: json['imgUrl'],
        userPoint: json['userPoint']);
  }

  void toPrint() {
    print("$question, $category, $content, $imgUrl, $userPoint");
  }
}
