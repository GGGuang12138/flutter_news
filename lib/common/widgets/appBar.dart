import 'package:flutter/material.dart';

Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    brightness: Brightness.light,
    elevation: 0,
    title: Center(
      child: title,
    ),
    leading: leading,
    actions: actions,
  );
}