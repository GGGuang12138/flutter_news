import 'package:flutter/material.dart';

class welcomepage extends StatefulWidget {
  welcomepage({Key key}) : super(key: key);

  @override
  _welcomepageState createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("hello world"),
    );
  }
}