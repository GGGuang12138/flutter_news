

import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_screenutil/screenutil.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}



class _WelcomePageState extends State<WelcomePage> {
    /// 页标题
  Widget _buildPageHeadTitle() {
    return Container(
        padding: EdgeInsets.only(top: duSetHeight(200)),
        child: Text(
          "医信 为生命保驾护航",
          style: TextStyle(
              color: AppColors.primaryText, fontSize: duSetFontSize(36)),
        ));
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: FlatButton(
        child: Text(
          "点击进入",
          style: TextStyle(
              color: AppColors.primaryElementText, fontSize: duSetFontSize(16)),
        ),
        color: AppColors.primaryElement,
        shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
        onPressed: () {
                  Navigator.pushNamed(context, "/sign_in");
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // 高度减去 顶部、底部 导航
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildPageHeadTitle(),
            Spacer(),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}
