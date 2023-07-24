// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/favorite_cubit.dart';
import 'item.dart';

// ignore: must_be_immutable
class listItem extends StatelessWidget {
  // String item, price = "No Data";
  CartItem i;
  // double rating;
  listItem({super.key, required this.i});

  Color border = const Color.fromARGB(255, 7, 1, 11);

  @override
  Widget build(BuildContext context) {
    BuildContext ct = context;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
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
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      height: 85,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 219, 216, 216),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          onTap: () {
            // BlocProvider.of<CartCubit>(context).incre();
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return loadBottom(i, ct);
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(Icons.broken_image),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(i.itemName,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Rating " + i.itemRating.toString() + "/10",
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w500)),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Price - \$" + i.itemPrice.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ],
              ),
              BlocProvider(
                create: (context) => Favor(
                    dis: const Icon(Icons.favorite_outline), con: context),
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: BlocBuilder<Favor, Icon?>(
                    builder: (context, state) {
                      return IconButton(
                        iconSize: 18,
                        tooltip: "Add to Favorite",
                        onPressed: BlocProvider.of<Favor>(context).swap,
                        icon: state as Widget,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox loadBottom(CartItem curItem, BuildContext context) {
  return SizedBox(
    height: 200,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(curItem.itemName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26)),
                Text("Rating ${curItem.itemRating}/10",
                    style: const TextStyle(
                        fontSize: 9, fontWeight: FontWeight.w500)),
                Text("Price - \$${curItem.itemPrice}",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartCubit>(context).addItem(curItem);
                        Navigator.pop(context);
                      },
                      child: const Text("ADD TO CART")),
                )),
          )
        ],
      ),
    ),
  );
}
