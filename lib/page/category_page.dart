import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../service/service_method.dart';
import '../component/category/TopCategory.dart';
import '../component/category/SecondaryCategory.dart';
import '../model/GoodsCategory.dart';
import '../model/categoryGood.dart';
import 'package:provide/provide.dart';
import '../provide/category.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshFooterState<RefreshFooter>> _footKey = new GlobalKey<RefreshFooterState<RefreshFooter>>();

  @override
  void initState() {
    fetchData('getCategory').then((res) {
      var jsonData = json.decode(res.toString());
      List<GoodsTopCategoryModel> list = (jsonData['data'] as List).map((item) => GoodsTopCategoryModel.fromJson(item)).toList();
      Provide.value<Category>(context).updateCategoryList(list);
    });
  }

  @override
  Widget build(BuildContext context) {
     print('欢饮来到这个模块category');
    return Scaffold(
      appBar: AppBar(title:Text('百姓生活+')),
      body: EasyRefresh(
        key: _easyRefreshKey,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopCategory(),
              Container(
                alignment: Alignment.topLeft,
                constraints: BoxConstraints(),
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                 SecondaryCategory(),
                ],
              ),
              )
            ],
          )
        ),
        loadMore: () {
           
        },
        refreshFooter: ClassicsFooter(
          key: _footKey,
          bgColor:Colors.white,
          textColor: Colors.pink,
          moreInfoColor: Colors.pink,
          showMore: true,
          noMoreText: '',
          moreInfo: '加载中',
          loadReadyText:'上拉加载....'
        ),
      )
    );
  }
}
