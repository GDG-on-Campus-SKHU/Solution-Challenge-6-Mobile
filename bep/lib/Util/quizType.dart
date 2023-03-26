enum quizType { Land, Water }

String quizTypeToString(quizType type) {
  switch (type) {
    case quizType.Land:
      return "Land";
    case quizType.Water:
      return "Water";
    default:
      throw Exception("Unknown quize type");
  }
}

quizType stringToQuizType(String str) {
  switch (str) {
    case "Land":
      return quizType.Land;
    case "Land":
      return quizType.Water;
    default:
      throw Exception("Unknown type string $str");
  }
}
