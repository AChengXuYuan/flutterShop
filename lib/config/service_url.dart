const serviceUrl = 'http://v.jspang.com:8088/baixing/';

const servicePath = {
  'homePageContext': serviceUrl + 'wxmini/homePageContent',
  'homePageBelowConten': serviceUrl+'wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl+'wxmini/getCategory', //商品类别信息
  'categoryGoods': serviceUrl+'wxmini/getMallGoods', // 商品类别商品
};