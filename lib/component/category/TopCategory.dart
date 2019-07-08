import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/category.dart';

class TopCategory extends StatefulWidget {
  @override
  _TopCategoryState createState() => _TopCategoryState();
}

class _TopCategoryState extends State<TopCategory> {

  int activeIndex = 0;

  Widget _text(data, index, active){
    return InkWell(
      onTap: () {
        Provide.value<Category>(context).updateTopCategoryIndex(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom:BorderSide(color: Colors.black26, width:1)
          )
        ),
        height:ScreenUtil().setHeight(80),
        padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(
          data.mallCategoryName,
          style: TextStyle(color: active ? Colors.pink : Colors.black26)
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<Category>(
      builder: (context, child, category) {
        return Container(
          height: ScreenUtil().setHeight(1080),
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
            border: Border(
              right:BorderSide(color: Colors.black26, width:1)
            )
          ),
          child: ListView.builder(
            itemCount: category.categoryList.length,
            itemBuilder: (context, index) {
              return _text(category.categoryList[index], index, index == category.selecteTopCategoryIndex ? true : false);
            } 
          )
        );
      },
    );
  }
}