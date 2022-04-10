import 'package:flutter/material.dart';
import 'Product.dart';
import 'CartService.dart';

class ProductScreen extends StatelessWidget {

  final ProductModel product;

  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name.toString())),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: new SingleChildScrollView(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Image.asset(product.image!),
                      height: 300,
                    ),
                    Text(product.name.toString()),
                    Text(product.description.toString()),
                    FlatButton(onPressed: () {

                    },
                      child: Text('Add to cart'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      height: 50,
                    )
                  ]
              ),
          ),
      ),
    );
  }
}