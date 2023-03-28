enum quizType { Land, Water, Climate, Other }

String quizTypeToString(quizType type) {
  switch (type) {
    case quizType.Land:
      return "Land";
    case quizType.Water:
      return "Water";
    case quizType.Climate:
      return "Climate";
    case quizType.Other:
      return "Other";
    default:
      throw Exception("Unknown quize type");
  }
}

quizType stringToQuizType(String str) {
  switch (str) {
    case "Life on Land":
      return quizType.Land;
    case "Life Below Water":
      return quizType.Water;
    case "Climate Action":
      return quizType.Climate;
    case "Other":
      return quizType.Other;
    default:
      throw Exception("Unknown type string $str");
  }
}
