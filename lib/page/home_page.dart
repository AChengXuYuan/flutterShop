import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../component/SwiperDiy.dart';
import '../component/TopNavigator.dart';
import '../component/ADBanner.dart';
import '../component/LeaderPhone.dart';
import '../component/Recommend.dart';
import '../component/FloorGoods.dart';
import '../component/HotGoodsRegion.dart';


class HomePage extends StatefulWidget  {

  final Widget child;
  
  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

   GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
   GlobalKey<RefreshFooterState<RefreshFooter>> _footKey = new GlobalKey<RefreshFooterState<RefreshFooter>>();

   List<Map> hotGoodsList = new List<Map>();
   int page = 1;

  @override
  void initState() {
    fetchData('homePageBelowConten', formData:{'page': page }).then((data){
      var jsonData = json.decode(data.toString());
      this.setState((){
        hotGoodsList.addAll((jsonData['data'] as List ).cast());
      });
    });
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body:FutureBuilder(
        future:fetchData('homePageContext', formData: {'lon':'115.02932','lat':'35.76189'}),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=json.decode(snapshot.data.toString());
            List<Map> swiperDataList = (data['data']['slides'] as List).cast(); // 顶部轮播组件数
            List navigatorsData = (data['data']['category'] as List).cast(); // 商品分类导航
            String adbannerPic = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
            String  leaderPic= data['data']['shopInfo']['leaderImage'];  //店长图片
            String  phoneNumber = data['data']['shopInfo']['leaderPhone']; //店长电话 
            List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐
            String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片 
            List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层1商品和图片 
            List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层1商品和图片 
            List<Map> floorList =  [
              { 'goods': floor1, 'titleImg': floor1Title },
              { 'goods': floor2, 'titleImg': floor2Title },
              { 'goods': floor3, 'titleImg': floor3Title },
            ];
            return EasyRefresh(
              key: _easyRefreshKey,
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
                  TopNavigator(navigatorList: navigatorsData), //商品分类导航组件
                  ADBanner(advertismentPic: adbannerPic), // 广告组件
                  LeaderPhone(pic: leaderPic, phoneNumber: phoneNumber,), // 店长联系组件
                  Recommend(dataList: recommendList), //店长联系组件
                  FloorGoods(datas: floorList), //楼层商品展示组件
                  HotGoodsRegion(datalist: this.hotGoodsList), //热门商品推荐
                ],
              ),
              loadMore: () async {
                 fetchData('homePageBelowConten', formData:{'page': page + 1 }).then((data){
                  var jsonData = json.decode(data.toString());
                  this.setState((){
                    hotGoodsList.addAll((jsonData['data'] as List ).cast());
                  });
                });
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
            );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        },
      )
    );
  }
}