import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class  FloorGoods extends StatelessWidget {

  final List datas;

  FloorGoods({ Key key, this.datas}) : super(key: key);

  Widget _goodsRegion(List<Map> list) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _goodsItem(list[0]),
            Column(
              children: <Widget>[
                 _goodsItem(list[1]),
                  _goodsItem(list[2]),
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
              _goodsItem(list[3]),
              _goodsItem(list[4]),
          ],
        )
        //子项
      ],
    );
  }

  Widget _goodsItem(data) {
    return InkWell(
      onTap: () { print('click goods');},
      child:  Container(
        width: ScreenUtil().setWidth(375),
        child: Image.network(data['image']),
      )
    );
  }

  Widget _floorItem(List<Map> data, String titleimg) {
    return Column(
      children: <Widget>[
        Image.network(titleimg),
        _goodsRegion(data)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: this.datas.map((item){
          return _floorItem(item['goods'], item['titleImg']);
        }).toList(),
      );
  }
}