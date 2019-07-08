import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import './../../provide/category.dart';

class SecondaryCategory extends StatefulWidget {
  @override
  _SecondaryCategoryState createState() => _SecondaryCategoryState();
}

class _SecondaryCategoryState extends State<SecondaryCategory> {

  int activeIndex = 0;

  Widget _text(data, index, active) {
    return InkWell(
      onTap: () {
        Provide.value<Category>(context).updateSubCategoryIndex(index);
      },
      child: Container(
        height:ScreenUtil().setHeight(80),
        width:ScreenUtil().setWidth(100),
        padding:EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          data.mallSubName,
          style:TextStyle(
            color: active ? Colors.pink : Colors.black26
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<Category>(
      builder: (context, child, category) {
        List list = category.selectCurrentSecondaryCategoryList();
        return Container(
          width: ScreenUtil().setWidth(570),
          height:ScreenUtil().setHeight(80),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1,color: Colors.black12)
            )
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context,index) {
              return _text(list[index], index, category.selectSubCategoryIndex == index ? true :false );
            },
          ),
        );
      }
    );
  }
}