/// 检查手机号码格式
bool duIsPhone(String input) {
  if (input == null || input.isEmpty) return false;
  // 手机正则
  String regexEmail = '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$';
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool duCheckStringLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
