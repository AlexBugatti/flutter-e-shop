import 'Product.dart';

class CartService {
  static CartService? _instance;

  CartService._() {}

  static Future<CartService> instance() async {
    // we can await things here

    List<ProductModel> products;

    if (_instance == null) {
      _instance = CartService._();
    }

    return _instance!;
  }
}