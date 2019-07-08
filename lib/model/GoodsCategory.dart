
/**
 * 商品一级分类
 */
class GoodsTopCategoryModel {
  String mallCategoryId;
  String mallCategoryName;
  List<GoodsSecondaryCategoryModel> bxMallSubDto;
  Null comments;
  String image;

  GoodsTopCategoryModel(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  factory GoodsTopCategoryModel.fromJson(Map<String, dynamic> json) {
    String mallCategoryId = json['mallCategoryId'];
    String mallCategoryName = json['mallCategoryName'];
    List<GoodsSecondaryCategoryModel> bxMallSubDto;
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<GoodsSecondaryCategoryModel>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new GoodsSecondaryCategoryModel.fromJson(v));
      });
    }
    Null comments = json['comments'];
    String image = json['image'];
    return GoodsTopCategoryModel(
      mallCategoryId: mallCategoryId,
      mallCategoryName: mallCategoryName,
      bxMallSubDto: bxMallSubDto,
      comments: comments,
      image: image,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

/**
 * 商品二级分类
 */
class GoodsSecondaryCategoryModel {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  GoodsSecondaryCategoryModel(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  GoodsSecondaryCategoryModel.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}