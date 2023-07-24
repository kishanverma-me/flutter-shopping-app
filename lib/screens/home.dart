import 'package:bloc_shopping/Utils/items_list.dart';
import 'package:bloc_shopping/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Utils/item.dart';
import '../Utils/list_builder.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  int favoriteCount = 0;
  var di = {
    "Kalayanam",
    "Red Pill",
    "Matar Paneer",
    "French Fry",
    "Apple Juice",
    "Banana Shake",
    "User Data"
  };
  var dp = {"2000", "569", "800", "69", "10", "12", "98000"};
  var dr = {9.8, 8.5, 9.5, 6.9, 2.5, 0.69, 9.9};

  @override
  Widget build(BuildContext context) {
    Color border = const Color.fromARGB(255, 158, 77, 224);

    void fuckCart(CartItemList dat) {
      Navigator.pushNamed(context, "/cart", arguments: dat);
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        title:
            const Text("Shop", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          BlocBuilder<CartCubit, CartItemList?>(
            builder: (context, state) {
              return Badge(
                label: Text(BlocProvider.of<CartCubit>(context).getAll()),
                child: const Icon(Icons.favorite_border_outlined),
              );
            },
          ),
          BlocBuilder<CartCubit, CartItemList?>(
            builder: (context, state) {
              return TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: () {
                    fuckCart(BlocProvider.of<CartCubit>(context).cartList);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 16,
                      ),
                      Text(
                        "Cart(${state!.items!.length})",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ));
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 244, 244),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text(
                    "Food Items",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 25, 10),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      border: Border(
                          top: BorderSide(
                              color: border,
                              width: 0,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          bottom: BorderSide(
                              color: border,
                              width: 0,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          right: BorderSide(
                              color: border,
                              width: 0,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          left: BorderSide(
                              color: border,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(51, 155, 155, 155),
                            offset: Offset(0, 0),
                            blurRadius: 14)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: const Color.fromARGB(255, 213, 213, 213),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  All Category",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ),
                  ),
                ) //Top category bar
              ],
            ),
            Expanded(child: _listBuilder(di, dp, dr, di.length))
          ],
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
      ,
    );
  }
}

Widget _listBuilder(Set items, Set price, Set rating, int count) {
  return ListView.builder(
      itemCount: count,
      padding: const EdgeInsets.all(20),
      itemBuilder: (BuildContext context, index) {
        return listItem(
            i: CartItem(
          itemName: items.elementAt(index),
          itemPrice: price.elementAt(index),
          itemCount: 1,
          itemDescription: "This is Sample Description",
          itemRating: rating.elementAt(index),
        ));
      });
}
