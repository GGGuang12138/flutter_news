import 'package:flutter/material.dart';
import 'package:flutter_news/common/values/values.dart';

Widget transparentAppBar({
  @required BuildContext context,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    brightness: Brightness.light,
    elevation: 0,
    title: Text(''),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}