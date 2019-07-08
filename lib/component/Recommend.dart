import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {

  final List dataList;

  Recommend({Key key, this.dataList}) : super(key: key);

  /**
   * 标题头
   */
  Widget _title(String title) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding:EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration:BoxDecoration(
        color: Colors.white,
        border:Border(
          bottom:BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color:Colors.pink
        )
      ),
    );
  }

  Widget _item(Map data) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right:BorderSide(color:Colors.black12, width: 1)
          )
        ),
        child:  Column(
        children: <Widget>[
          Image.network(data['image']),
          Text('￥${data['mallPrice']}'),
          Text(
            '${data['price']}',
            style: TextStyle(
              color: Colors.grey,
            )
          )
        ],
      )
      )
    );
  }

  Widget _list(List list) {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: list.map((item) {
          return _item(item);
        }).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _title('商品推荐'),
          _list(this.dataList)
        ],
      )
    );
  }
}