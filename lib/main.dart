import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';
import './page/index_page.dart';
import './provide/category.dart';


void main() {
  var category = Category();
  var providers = Providers();
  providers
  ..provide(Provider<Category>.value(category));
  runApp(ProviderNode(child:MyApp(), providers: providers));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage()
      )
    );
  }
}