import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotGoodsRegion extends StatelessWidget {

  final List datalist;

  HotGoodsRegion({Key key, this.datalist}) : super(key: key);

  Widget _goodsItem(Map data) {
    return InkWell(
      onTap: () {print('click hotgoods');},
      child: Container(
        width:ScreenUtil().setWidth(365),
        padding:EdgeInsets.all(5.0),
        margin: EdgeInsets.only(
          bottom: 3.0
        ),
        child:Column(
          children: <Widget>[
            Image.network(
              data['image'],
              width: ScreenUtil().setWidth(355),
            ),
            Row(
              children: <Widget>[
                Text('￥${data['mallPrice']}'),
                Text(
                  '￥${data['price']}',
                  style:TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _title(String title) {
    return Container(
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _title('火爆商品区'),
        Wrap(
          spacing: 2,
          children: this.datalist.map((item) {
          return _goodsItem(item);
        }).toList(),
        )
      ],
    );
  }
}