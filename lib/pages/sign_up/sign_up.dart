import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //真实姓名控制器
  final TextEditingController _usernameController = TextEditingController();
  //phone控制器
  final TextEditingController _phoneController = TextEditingController();
  //password控制器
  final TextEditingController _passwordController = TextEditingController();

  // 执行注册验证操作
  _handleSignUp() {
    if ((_phoneController.value.text)== null|| (_phoneController.value.text).isEmpty) {
      toastInfo(msg: '姓名不能为空');
      return;
    }
    if (!duIsPhone(_phoneController.value.text)) {
      toastInfo(msg: '请正确输入手机号码');
      return;
    }
    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    Navigator.pop(context);
  }

  ///logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(20)),
      child: Text(
        "注 册",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  ///注册表单
  Widget _buildInputForm() {
    return Column(children: <Widget>[
      Container(
        width: duSetWidth(315),
        height: duSetHeight(60),
        margin: EdgeInsets.only(top: duSetHeight(15)),
        decoration: BoxDecoration(
          color: AppColors.secondaryElement,
          borderRadius: Radii.k6pxRadius,
        ),
        child: TextField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "真实姓名",
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
        margin: EdgeInsets.only(top: duSetHeight(15)),
        decoration: BoxDecoration(
          color: AppColors.secondaryElement,
          borderRadius: Radii.k6pxRadius,
        ),
        child: TextField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "手机号码",
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
          obscureText: false, // 隐藏输入内容, 密码框
        ),
      ),
      Container(
        width: duSetWidth(315),
        height: duSetHeight(60),
        margin: EdgeInsets.only(top: duSetHeight(15)),
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
      Container(
        width: duSetWidth(315),
        height: duSetHeight(55),
        margin: EdgeInsets.only(top: duSetHeight(15)),
        child: FlatButton(
          onPressed: () {
            _handleSignUp();
          },
          color: AppColors.primaryElement,
          shape: RoundedRectangleBorder(
            borderRadius: Radii.k6pxRadius,
          ),
          child: Text(
            "新建用户",
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: duSetWidth(2),
              color: AppColors.primaryElementText,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w100,
              fontSize: duSetFontSize(19),
              height: 1,
            ),
          ),
        ),
      ),
      Container(
          height: duSetHeight(22),
          margin: EdgeInsets.only(top: duSetHeight(15)),
          child: RichText(
            maxLines: 2,
            text: TextSpan(
                text: '注册即代表您已阅读并同意',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: '服务条款',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.secondaryElementText,
                        decoration: TextDecoration.underline),
                    //recognizer: recognizer
                  ),
                ]),
          )),
    ]);
  }

  ///第三方注册
  Widget _buildThirdPartyLogin() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      width: duSetWidth(295),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "使用其他方式注册",
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

  ///已有账号
  Widget _buildHaveAccountButton() {
    return Container(
      width: duSetWidth(315),
      height: duSetHeight(55),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColors.thirdElement,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        ),
        child: Text(
          "已经有一个账号",
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: duSetWidth(1),
            color: AppColors.secondaryElement,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w100,
            fontSize: duSetFontSize(19),
            height: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
