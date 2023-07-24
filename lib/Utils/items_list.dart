import 'package:bloc_shopping/Utils/item.dart';

class CartItemList {
  int favo = 0;
  int totalPrice = 0;
  int itemCount = 0;
  List<CartItem>? items = [];
  CartItemList();
  void addFavo() {
    favo += 1;
  }

  void removeFavo() {
    favo -= 1;
  }

  void addItem(CartItem i) {
    items?.add(i);
    itemCount = items!.length;
    totalPrice += int.parse(i.itemPrice);
  }
}
