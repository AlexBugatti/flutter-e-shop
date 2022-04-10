import 'dart:collection';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'Product.dart';
import 'ProductScreen.dart';
import 'CartScreen.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Shop'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              _navigateToCartScreen(context);
            },
            child: Text("Cart"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],

      ),
      body: MyHomePage()
    );
  }

  void _navigateToCartScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
  }

}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,
    child: Text('E-Shop'));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<ProductModel>;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: items.length,
                  itemBuilder: (BuildContext c, int i) {
                    ProductModel resultItem = items[i];

                    return Card(
                      child: InkResponse(
                        child: Container(
                          child: Image.asset(resultItem.image!),
                        ),
                        onTap: () {
                          _navigateToProductScreen(context, resultItem);
                        },
                      )
                    );
                  },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    );
  }
  Future<List<ProductModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/products.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }

  void _navigateToProductScreen(BuildContext context, ProductModel model) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductScreen(product: model)));
  }

}
