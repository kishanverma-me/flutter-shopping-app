import 'package:bloc/bloc.dart';
import 'package:bloc_shopping/Utils/item.dart';
import 'package:bloc_shopping/Utils/items_list.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartItemList> {
  CartItemList cartLis = CartItemList();

  int favo = 0;
  CartCubit({required this.cartLis}) : super(cartLis);
  CartItemList cartList = CartItemList();

  void addItem(CartItem it) {
    cartList.addItem(it);
    CartItemList newCart = CartItemList();
    newCart.items = cartList.items;
    emit(newCart);
  }

  void set() {
    cartList.addFavo();
    CartItemList newCart = CartItemList();
    newCart.items = cartList.items;
    emit(newCart);
  }

  void unset() {
    cartList.removeFavo();
    CartItemList newCart = CartItemList();
    newCart.items = cartList.items;
    emit(newCart);
  }

  String getAll() {
    return cartList.favo.toString();
  }
}
