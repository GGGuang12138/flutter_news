import 'package:flutter/material.dart';
import 'package:flutter_news/common/entity/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

Widget patientCategoriesWidget(
    {List<CategoryResponseEntity> categories,
    String selCategoryCode,
    Function(CategoryResponseEntity) onTap}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8,0,10,0),
                child: Row(
                  children: categories.map<Widget>((item) {
                    return Container(
                      alignment: Alignment.center,
                      height: duSetHeight(52),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        child: selCategoryCode == item.code
                            ? Container(
                                height: duSetWidth(30),
                                width: duSetWidth(item.title.length*27.0),
                                child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    color: AppColors.primaryElement,
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      side: Borders.secondBorder,
                                      borderRadius: Radii.k9pxRadius,
                                    ),
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        color: AppColors.secondaryElement,
                                        fontSize: duSetFontSize(20),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              )
                            : Text(
                                item.title,
                                style: TextStyle(
                                  //backgroundColor: Colors.grey[200],
                                  color: AppColors.primaryText,
                                  fontSize: duSetFontSize(20),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        onTap: () => onTap(item),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
}
