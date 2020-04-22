import 'package:flutter/material.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Container(
            child: WelcomePage()
          ),
        ),
      ),
    );
  }
}