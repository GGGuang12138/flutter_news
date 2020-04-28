import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/pages/doctor/doctor.dart';
import 'package:flutter_news/pages/main/main.dart';
import 'package:flutter_news/pages/person/person.dart';

class Application extends StatefulWidget {
  Application({Key key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码，初始为0
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = [
    '病人管理',
    '远程会诊',
    '个人信息',
  ];
  // 页控制器
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        IconData(0xe603, fontFamily: 'iconfont'),
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        IconData(0xe603, fontFamily: 'iconfont'),
        color: AppColors.primaryText,
      ),
      title: Text('患者检测'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Icon(
          IconData(0xe601, fontFamily: 'iconfont'),
          color: AppColors.tabBarElement,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Icon(
          IconData(0xe601, fontFamily: 'iconfont'),
          color: AppColors.secondaryElementText,
        ),
      ),
      title: Text('远程会诊'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        IconData(0xe602, fontFamily: 'iconfont'),
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        IconData(0xe602, fontFamily: 'iconfont'),
        color: AppColors.secondaryElementText,
      ),
      title: Text('个人中心'),
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // 底部导航栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // 底部页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  ///顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  ///内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        DoctorPage(),
        PersonPage()
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  ///底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      // type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
