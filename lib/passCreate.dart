import 'dart:math';

String generatePassword(bool upperLetter, bool lowerLetter, bool isNumber,
    bool isSpecial, double lengthPass) {
  final letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final number = '0123456789';
  final special = '@#%^*>\$@?/[]=+';

  int length = lengthPass.toInt();
  String chars = "";
  if (upperLetter) chars += '$letterUpperCase';
  if (lowerLetter) chars += '$letterLowerCase';
  if (isNumber) chars += '$number';
  if (isSpecial) chars += '$special';

  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars[indexRandom];
  }).join('');
}
