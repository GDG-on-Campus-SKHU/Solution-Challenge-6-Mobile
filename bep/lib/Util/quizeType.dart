enum quizeType { Land, Water }

String quizeTypeToString(quizeType type) {
  switch (type) {
    case quizeType.Land:
      return "Land";
    case quizeType.Water:
      return "Water";
    default:
      throw Exception("Unknown quize type");
  }
}

quizeType stringToQuizeType(String str) {
  switch (str) {
    case "Land":
      return quizeType.Land;
    case "Land":
      return quizeType.Water;
    default:
      throw Exception("Unknown type string $str");
  }
}
