extension GlobalExtension on String {
  int get colorConvertInteger {
    final valueHasTackRemove = replaceFirst('#', '0xff');

    int? value = int.parse(valueHasTackRemove);
    return value;
  }
}
