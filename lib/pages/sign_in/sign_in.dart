import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/api.dart';
import 'package:flutter_news/common/entity/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/toast.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //username控制器
  final TextEditingController _usernameController = TextEditingController();
  //password控制器
  final TextEditingController _passwordController = TextEditingController();

  // 执行登录操作
  _handleSignIn() async {
    if (!duIsPhone(_usernameController.value.text)) {
      toastInfo(msg: '请正确输入手机号码');
      return;
    }
    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不正确');
      return;
    }
    UserLoginRequestEntity params = UserLoginRequestEntity(
      username: _usernameController.value.text,
      password: duSHA256(_passwordController.value.text),
    );

    UserLoginResponseEntity res = await UserAPI.login(params: params);

    print(res.accessToken);
    // 写本地 access_token , 不写全局，业务：离线登录
    // 全局数据 gUser
  }

  // 跳转 注册界面
  _handleNavSignUp() {
    Navigator.pushNamed(
      context,
      "/sign_up",
    );
  }

  ///logo
  Widget _buildLogo() {
    return Container(
      child: Spacer(),
    );
  }

  ///登录表单
  Widget _buildInputForm() {
    return Column(
      children: <Widget>[
        Container(
          width: duSetWidth(315),
          height: duSetHeight(60),
          decoration: BoxDecoration(
            color: AppColors.secondaryElement,
            borderRadius: Radii.k6pxRadius,
          ),
          child: TextField(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "账号/手机号码",
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w300,
              fontSize: duSetFontSize(21),
            ),
            maxLines: 1,
            autocorrect: false, // 自动纠正
            obscureText: false, // 隐藏输入内容
          ),
        ),
        Container(
          width: duSetWidth(315),
          height: duSetHeight(60),
          margin: EdgeInsets.only(top: duSetHeight(20)),
          decoration: BoxDecoration(
            color: AppColors.secondaryElement,
            borderRadius: Radii.k6pxRadius,
          ),
          child: TextField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "密码",
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w300,
              fontSize: duSetFontSize(21),
            ),
            maxLines: 1,
            autocorrect: false, // 自动纠正
            obscureText: true, // 隐藏输入内容, 密码框
          ),
        ),
      ],
    );
  }

  ///登陆注册按钮
  Widget _buildInUpButton() {
    return Container(
      width: duSetWidth(315),
      margin: EdgeInsets.only(top: duSetHeight(20)),
      child: Row(
        children: <Widget>[
          Container(
            width: duSetWidth(130),
            height: duSetHeight(55),
            child: FlatButton(
              onPressed: () {
                _handleNavSignUp();
              },
              color: AppColors.thirdElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
              child: Text(
                "注册",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(20),
                  height: 1,
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: duSetWidth(150),
            height: duSetHeight(55),
            child: FlatButton(
              onPressed: () {
                _handleSignIn();
              },
              color: AppColors.primaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
              child: Text(
                "登陆",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(20),
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///忘记密码按钮
  Widget _buildForgotButton() {
    return Container(
      height: duSetHeight(22),
      margin: EdgeInsets.only(top: duSetHeight(15)),
      child: FlatButton(
        onPressed: () => {},
        child: Text("忘记密码？",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(15),
                height: 1)),
      ),
    );
  }

  ///第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(50)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "使用其他方式登陆",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                Container(
                  width: duSetWidth(88),
                  height: duSetHeight(44),
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: Borders.primaryBorder,
                      borderRadius: Radii.k6pxRadius,
                    ),
                    child: Image.asset(
                      "assets/images/weixin.png",
                      width: duSetWidth(35),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: duSetWidth(88),
                  height: duSetHeight(44),
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: Borders.primaryBorder,
                      borderRadius: Radii.k6pxRadius,
                    ),
                    child: Image.asset(
                      "assets/images/zfb.png",
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: duSetWidth(88),
                  height: duSetHeight(44),
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: Borders.primaryBorder,
                      borderRadius: Radii.k6pxRadius,
                    ),
                    child: Image.asset(
                      "assets/images/weibo.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            _buildInUpButton(),
            _buildForgotButton(),
            Spacer(),
            _buildThirdPartyLogin(),
          ],
        ),
      ),
    );
  }
}
