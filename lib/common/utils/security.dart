import 'dart:convert';
import 'package:crypto/crypto.dart';

/// SHA256
String duSHA256(String input) {
  String salt = 'ggbabademimanicaibutou'; // 加盐
  var bytes = utf8.encode(input + salt);
  var digest = sha256.convert(bytes);

  return digest.toString();
}
