import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/patient.dart';
import 'package:flutter_news/common/entity/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/pages/main/categories_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryResponseEntity> _categories; // 分类

  String _selCategoryCode; //选中分类

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }
  // 读取所有数据
  _loadAllData() async {
    _categories = await PatientAPI.categories();
    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  /// 病人分类
  Widget _buildCategories() {
    return patientCategoriesWidget(
      categories: _categories,
      selCategoryCode: _selCategoryCode,
      onTap: (CategoryResponseEntity item) {
        setState(() {
          _selCategoryCode = item.code;
        });
      },
    );
  }
  
  ///病人列表
  Widget _buildPatientList(){
    return Container(
      height: duSetHeight(137),
      color: Colors.blueAccent,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCategories(),
          _buildPatientList(),
        ],
      ),
    );
  }
}