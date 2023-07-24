import 'package:bloc_shopping/Utils/calc_total.dart';
import 'package:bloc_shopping/Utils/cart_list.dart';
import 'package:flutter/material.dart';
import '../Utils/items_list.dart';

// ignore: must_be_immutable
class CartActivity extends StatelessWidget {
  CartItemList data;
  CartActivity(this.data);
  @override
  Widget build(BuildContext context) {
    int totalPrice = data.totalPrice;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text("Cart"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _listBuilder(data)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: total(totalPrice: totalPrice),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 25, 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 130,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 18, 17, 17),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text("FUCK"),
                                  content: const Text(
                                    "You are Broke🤧",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: const Text("Go get a Job🤡"))
                                  ],
                                ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Pay ",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            )
          ]),
    );
  }
}

Widget _listBuilder(CartItemList cat) {
  return ListView.builder(
      itemCount: cat.items?.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (BuildContext context, index) {
        // int price = int.parse(cat.items![index].itemPrice);

        return cartList(
          i: cat.items![index],
        );
      });
}
