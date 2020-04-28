import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign_in":(context) => SignInPage(),//登陆
  "/sign_up":(context) => SignUpPage(),//注册
  "/app": (context) => Application(), // 主程序
};