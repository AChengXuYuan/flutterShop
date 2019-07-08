import 'package:flutter/material.dart';
import '../model/GoodsCategory.dart';
import '../model/categoryGood.dart';
import '../service/service_method.dart';
import 'dart:convert';

class Category with ChangeNotifier{

  List<GoodsTopCategoryModel> categoryList = [];
  List<CategoryGoodModel> categoryGoodList = [];
  int selecteTopCategoryIndex = 0;
  int selectSubCategoryIndex = 0;

  Category(){}

  updateCategoryList(List<GoodsTopCategoryModel> list) {
    list.forEach((item) => {
      item.bxMallSubDto.insert(0, GoodsSecondaryCategoryModel.fromJson({
          'mallSubId': '',
          'mallCategoryId': item.mallCategoryId,
          'mallSubName': '全部',
          'comments': ''
      }))
    });
    categoryList = list;
    notifyListeners();
  }

  updateTopCategoryIndex(int index) {
    if(selecteTopCategoryIndex != index) {
      selecteTopCategoryIndex = index;
      selectSubCategoryIndex = 0;
    }
    notifyListeners();
  }

  updateSubCategoryIndex(int index) {
    if (selectSubCategoryIndex != index) {
       selectSubCategoryIndex = index;
    }
    notifyListeners();
  }

  getSelectSubCategoryIndex () {
    notifyListeners();
  }

  getCategoryGoods(categoryId, categorySubId, page){
    fetchData('categoryGoods', formData: { 'categoryId': categoryId, 'categorySubId': categorySubId, 'page': page }).then((res) {
      var jsonData = json.decode(res.toString());
      categoryGoodList = (jsonData['data'] as List).map((item) => CategoryGoodModel.fromJson(item)).toList();
      notifyListeners();
    });
  }

  selectCurrentSecondaryCategoryList() {
    if (categoryList.length <= selecteTopCategoryIndex ) {
      return [];
    } else {
      return categoryList[selecteTopCategoryIndex].bxMallSubDto;
    }
   
  }
}