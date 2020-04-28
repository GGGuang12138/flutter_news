import 'package:flutter_news/common/entity/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';

class PatientAPI {
  /// 分类
  static Future<List<CategoryResponseEntity>> categories(
      {bool cacheDisk = false}) async {
    var response = await HttpUtil().get('/patient/categories/1',);
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }
}
